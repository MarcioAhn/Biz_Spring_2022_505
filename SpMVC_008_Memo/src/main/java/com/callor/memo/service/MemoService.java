package com.callor.memo.service;

import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.MemoVO;
import com.callor.memo.pesistance.MemoDao;

public interface MemoService extends MemoDao{

	public int insert(MemoVO memoVO);

	public MemoVO findById(int m_seq);
	// 한개의 파일 업로드
	public String fileUp(MultipartFile file) throws Exception;
	// 업로드한 파일 삭제
	public boolean fileDelete(String filename) throws Exception;

	public String insertfileAndimage(MemoVO memoVO, MultipartFile file);
	
	
}
