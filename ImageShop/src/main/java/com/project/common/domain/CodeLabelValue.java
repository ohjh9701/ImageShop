package com.project.common.domain;

import lombok.Data;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor : final 필드와 @NonNull 필드에 대한 생성자 자동 생성
@RequiredArgsConstructor
@Data
public class CodeLabelValue {
	private final String value;
	private final String label;
}
