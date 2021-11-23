package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private Long rno;
	private String title;
	private String content;
	private String regdate;
	private String id;
	private Long bno;

	
	
}
