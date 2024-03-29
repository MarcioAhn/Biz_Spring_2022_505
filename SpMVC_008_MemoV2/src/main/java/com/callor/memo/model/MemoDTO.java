package com.callor.memo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * DTO : Data Transfer Object
 * 역할을 VO 와 같다
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class MemoDTO {
	private long m_seq;
	private String m_title;
	private String m_author;
	private String m_date;
	private String m_time;
	private String m_memo;
	private String m_image;	
	private String m_page;
	private String m_up_image;
}
