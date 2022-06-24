package com.callor.memo.pesistance;

import com.callor.memo.model.MemoVO;

public interface MemoDao extends GenericDao<MemoVO, Integer>{

	
	public void create_memo_table();
}
