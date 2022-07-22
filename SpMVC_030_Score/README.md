# titles를 사용한 JSP Layout 만들기
* view page(JSP)의 header, size, footer 등을 include 처리하여 Layout을 구성하는 도구
* JSP page ```<%@ include file="..." %>``` 형식으로 JSP 파일을 서로 연결하여 Layout을 구성하는데 성능상 이슈들이 있고
	JSP 파일들이 많아지면 관리가 다소 불편해지는 단점이 있다
* 이러한 단점을 극복하고자 사용하는 Layout 도구

``` 
<dependency>
	<groupId>org.apache.tiles</groupId>
	<artifactId>tiles-core</artifactId>
	<version>${org.tiles-version}</version>
</dependency>
<dependency>
	<groupId>org.apache.tiles</groupId>
	<artifactId>tiles-extras</artifactId>
	<version>${org.tiles-version}</version>
</dependency>
```