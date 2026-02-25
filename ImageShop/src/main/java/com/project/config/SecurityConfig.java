package com.project.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.project.common.security.CustomAccessDeniedHandler;
import com.project.common.security.CustomLoginSuccessHandler;
import com.project.common.security.CustomUserDetailsService;

import jakarta.servlet.DispatcherType;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
//@EnableMethodSecurity(prePostEnabled=true, securedEnabled=true)
public class SecurityConfig {

	@Autowired
	DataSource dataSource;

	@Bean
	SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
		log.info("security config 셋팅의 시작");

		// 1.csrf토큰 비활성화
		httpSecurity.csrf((csrf) -> csrf.disable());

		// 2.접근제한 정책 (시큐리티 인가정책)
		httpSecurity.authorizeHttpRequests(auth -> auth.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
				.requestMatchers("/accessError", "/login", "/logout").permitAll().requestMatchers("/board/**")
				.authenticated() // 게시판: 인증 필요
				.requestMatchers("/manager/**").hasRole("MANAGER") // 매니저기능: 인가 필요
				.requestMatchers("/admin/**").hasRole("ADMIN") // 관리자기능: 인가 필요
				.anyRequest().permitAll() // 그 외 모든 요청은 전부 인증/인가가 필요없이 허용
		);

		// 3.등록한 CustomAccessDeniedHandler.java를 접근 거부 처리자로 지정한다.
		httpSecurity.exceptionHandling(exception -> exception.accessDeniedHandler(createAccessDeniedHandler()));

		// 4.기본폼 로그인 활성화
		httpSecurity.formLogin(form -> form.loginPage("/auth/login") // 커스텀 로그인 페이지 URL
				.loginProcessingUrl("/login") // loginForm action URL
				// .defaultSuccessUrl("/board/list") //성공시 기본 화면 설정
				.successHandler(createAuthenticationSuccessHandler()).permitAll() // 로그인 페이지는 누구나 접근 가능해야 함
		);
		
		 // 5. 로그아웃 처리를 위한 URI를 지정하고, 로그아웃 후에 세션을 무효화
		httpSecurity.logout(logout ->
		 logout .logoutUrl("/auth/logout") // 로그아웃을 처리할 URL (기본값: /logout)
		 .logoutSuccessUrl("/auth/login") // 로그아웃 성공 시 이동할 페이지 .invalidateHttpSession(true) HTTP 세션 무효화 (기본값: true)
		 .deleteCookies("JSESSIONID", "remember-me") //로그아웃 시 관련 쿠키 삭제
		 .permitAll()); // 로그아웃 요청은 누구나 접근 가능해야 함 );
		 
		// 6. 자동 로그인 기능 설정
		httpSecurity.rememberMe(remember -> remember.key("project") // 인증 토큰 생성 시 사용할 키
				.tokenRepository(createJDBCRepository()) // DB를 이용한 토큰 저장소 설정
				.tokenValiditySeconds(60 * 60 * 24) // 토큰 유효 시간 설정 (현재 설정은 24시간)
		);

		return httpSecurity.build();
	}

	@Bean
	public PasswordEncoder createPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		  auth.userDetailsService(createUserDetailsService()).passwordEncoder(
	  createPasswordEncoder());
	  } // 스프링 시큐리티의 UserDetailsService를 구현한 클래스를 빈으로 등록한다.
	  
	  @Bean
	  public UserDetailsService createUserDetailsService() {
		  return new CustomUserDetailsService(); // 사용자가 정의한 비번 암호화 처리기를 빈으로 등록한다.
	  } 
	  
//	  @Bean
//	  public PasswordEncoder createPasswordEncoder() {
//		  return new CustomNoOpPasswordEncoder();
//	  }

	// 접근거부시 예외처리 설정을 클래스로 이동한다.
	@Bean
	public AccessDeniedHandler createAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	@Bean
	public AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();

	}

	private PersistentTokenRepository createJDBCRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;

	}
}