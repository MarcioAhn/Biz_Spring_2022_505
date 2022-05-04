# Spring Project에서 JSP 코딩

## EL(expression language) tag
* Controller에 받은 데이터를 표현하는 tag
* Controller에서 model.addAttribute("변수",값) 형식으로 데이터를 보내면 ${변수}와 같이 표현한다
* ${변수} 위치에 값을 rendering하여 html코드로 변환한다

## JSTL( JavaServerPage Standard tag lib)
* 줄여서 taglib 라고 표현한다
* 기존에 java 명령을 사용하여 JSP 파일에 코드를 부착하여 사용하였는데 그러한 방법은 디자이너와 협업을 매우 어렵게 요인이었다
* Spring, Tomcat 연동되는 프로젝트에서는 JSTL이라는 확장된 개념의 tag를 사용한다
* JSP 파일의 상단에 taglib 를 import하고나면 JSP파일의 html코드의 불편함이 없는 다양한 연산 코드를 추가할 수 있다
* 가장 많이 사용하는 taglib는 ```core``` lib 이다
```
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
```