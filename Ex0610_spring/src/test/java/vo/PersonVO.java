package vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

//@Getter : getter 메서드 생성
//@Setter : setter 메서드 생성
//@NoArgsConstructor : 파라미터 없는 생성자
//@AllArgsConstructor : 모든 필드를 매개변수로 갖는 생성자
//@RequiredArgsConstructor : final이나 @NonNull인 필드만 매개변수로 갖는 생성자
//@Data : getter, setter, RequiredArgsConstructor, ToString, Equals, HashCode를 한번에 설정한다.

@Data
public class PersonVO {
	String name;
	int age;
}
