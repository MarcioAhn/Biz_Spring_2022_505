package com.callor.score.controller.api;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.callor.score.model.StudentVO;
/*
 * @Controller 클래스는 request(요청)에 대하여 보통 view(.jsp)파일을
 * rendering하여 response(응답)하도록 설계하는 Router 클래스이다
 * 
 * 이 클래스에 @ResponseBody를 부착하면 view를 response 하는ㄷ ㅐ신에
 * 직접 문자열을 전송하거나 객체(List, VO)를 JSON type으로 response하도록
 * method에 적용을 한다
 * 
 * @RestController 클래스는 request에 대해서 기본값으로
 * JSON을 Response하도록 설계하는 Router 클래스이다
 * 
 * 모든 method에 마치 @Reest
 * 
 * RestControler는 view를 rendering하지 않는다
 * 
 */
import com.callor.score.service.StudentService;

@RestController
@RequestMapping(value="/api")
public class APIController {

	private final StudentService stService;
	public APIController(StudentService stService) {
		this.stService = stService;
	}
	
	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	public List<StudentVO> student() {
		return stService.selectAll();
	}
	/*
	 * http://localhost:8080/score/api/student/학번/delete 로 요청을 했을 때
	 * 학번에 해당하는 학생의 데이터를 삭제할 수 있도록 method 생성
	 * stService.delete(학번), stDao.delete(학번) student-mapper.xml.delete를
	 * 작성하여 학생의 데이터를 삭제할 수 있도록 코드 작성
	 */

	@ResponseBody
	@RequestMapping(value="/{st_num}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable("st_num") String st_num) {
		/*
		 * mybatis에서 delete를 수행한 후 몇개의 데이터가 삭제되었는지를
		 * return 해준다
		 * 여기서는 pk를 기준으로 삭제하기때문에 
		 * return 값은 삭제가 되었으면 1이 될것이고
		 * 삭제에 실패했으면 1미만의 값이 return
		 */
		int ret = stService.delete(st_num);
		if(ret > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/*
	 * method의 return type
	 * 
	 * void type: 아무것도 아닌 값을 return 하거나 말거나
	 */
	public void voidMethod() {
		return; // 아무것도 없는 값을 return, method를 종료한다
	}
	// primitive type : 정수, 실수, 문자 등등 기본 type의 값을 return
	public int intMethod() {
		return 0; 
		// return type이 int 형 이므로 최소 0이라도 return 해야 한다
		// return을 한다는 것은 이제 더이상 할일이 없어서 결과를 다시 되돌리기
		// return을 만나면 method는 종료한다
	}
	public char charMethod() {
		return 'A'; // return type이 char(문자)이믈 최소 한개의 임의 문자라도 return
	}
	
	// class(참조) type : String, VO, DTO, List 등의 클래스(객체) type return
	public String strMethod() {
		
		// return ㅎ라 값이 없으면 최소 null
		// return을 편리한 method가 더이상 할일이 없다
		// return null : 나를 호출한 
		return null;
	}
	
	
}
