package task;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import service.BoardServiceImpl;
import vo.Attach;

public class OrganizeFileJob implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String dateStr = new SimpleDateFormat("yyMMdd").format(cal.getTime());

		File file = new File("C:\\upload\\" + dateStr);
		File[] files = file.listFiles();

		List<Attach> dbList = new BoardServiceImpl().readAttachByPath(dateStr);

		// 배열 -> 리스트 변환
		List<File> fileList = new ArrayList<>(Arrays.asList(files));
		List<File> existFile = new ArrayList<File>();

		for (File f : fileList) {
			for (Attach a : dbList) {
				if (f.getAbsolutePath().contains(a.getUuid())) {
					existFile.add(f);
				}
			}
		}

		fileList.removeAll(existFile);
		System.out.println(dateStr + "폴더의 삭제된 파일들");
		System.out.println("===========================================");
		int cnt = 0;
		for (File f : fileList) {
			System.out.println(f);
			f.delete();
			cnt++;
		}
		System.out.println(cnt + "개의 파일 삭제됨");
	}
}
