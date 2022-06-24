package com.callor.memo.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.MemoVO;
import com.callor.memo.pesistance.MemoDao;
import com.callor.memo.service.MemoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemoServiceImplV1 implements MemoService {

	// Spring 에서 Server 의 특정한 폴더에 접근하기 위한 중간 도구

	private final String upLoadFolder;

	public MemoServiceImplV1(String upLoadFolder) {
		this.upLoadFolder = upLoadFolder;
	}

	@Autowired
	protected MemoDao memoDao;

	@Override
	public List<MemoVO> selectAll() {

		return memoDao.selectAll();
	}

	@Transactional
	@Override
	public int insert(MemoVO memoVO) {

		return 0;
	}

	public String insertfileAndimage(MemoVO memoVO, MultipartFile file) {
		// 메모 작성정보를 tbl_memo에 추가하기
		// 작성일자,시각을 자동으로 생성하기
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("HH:mm:ss");

		memoVO.setM_date(dateFormat.format(date));
		memoVO.setM_time(dateFormat1.format(date));

		// fileup을 이용해서 image파일 가져오기
		String fileName;
		try {
			fileName = fileUp(file);
			memoVO.setM_image(fileName);
			memoDao.insert(memoVO);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}

	}

	@Override
	public MemoVO findById(int m_seq) {
		return memoDao.findById(m_seq);
	}

	@Autowired
	@Override
	public void create_memo_table() {
		memoDao.create_memo_table();

	}

	@Override
	public MemoVO findById(Integer id) {
		return memoDao.findById(id);
	}

	@Override
	public int update(MemoVO vo) {
		return memoDao.update(vo);
	}

	@Override
	public int delete(Integer id) {
		return memoDao.delete(id);
	}

	@Override
	public String fileUp(MultipartFile file) throws Exception {

		if (file == null) {
			return null;
		}

		File dir = new File(upLoadFolder);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		String fileName = file.getOriginalFilename();

		/*
		 * 파일 업로드를 할때 원래 파일이름을 그대로 저장하면 해킹등의 위협에 노출될수 있다 그래서 파일이름 앞에 UUID 문자열을 첨부하여 파일을
		 * 저장하고 실제 사용자들에게 보여줄때는 원래 이름을 보여주는 식으로 코드를 작성해야 한다.
		 */
		// UUID 문자열 생성
		String strUUID = UUID.randomUUID().toString();

		fileName = String.format("%s-%s", strUUID, fileName);
		log.debug("변경된 파일이름 {}", fileName);

		File upLoadFile = new File(upLoadFolder, fileName);
		file.transferTo(upLoadFile);
		return fileName;

	}

	public boolean fileDelete(String filename) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
