package study2.calendar;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class Calendar2Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar calToday = Calendar.getInstance();
		int thisYear = calToday.get(Calendar.YEAR);
		int thisMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
		
		//화면에 보여줄 해당 "년/월"을 세팅해준다.
		int yy = request.getParameter("yy") == null ? thisYear : Integer.parseInt(request.getParameter("yy"));
		int MM = request.getParameter("MM") == null ? thisMonth : Integer.parseInt(request.getParameter("MM"));
		
		//이전월 클릭시에 1월(캘린더 객체에서는 0임)은 음수가 넘어오기에 년도를 -1해주고 월은 12월(11)로 세팅해준다
		if(MM == -1) {
			yy -= 1;
			MM = 11;
		}
		//다음월 클릭시에 12월은 알제 년도는 +1해주고 월은 1월(0)으로 세팅해준다.
		if(MM == 12) {
			yy++;
			MM = 0;
		}
		//선택한 해당 "년/월"의 1일의 요일을 뽑아준다
		calToday.set(yy, MM, 1);
		int startWeek = calToday.get(Calendar.DAY_OF_WEEK);
		int lastDay = calToday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		request.setAttribute("yy", yy);
		request.setAttribute("MM", MM);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		//오늘날짜도 담아준다
		request.setAttribute("toDay", toDay);
		request.setAttribute("thisYear", thisYear);
		request.setAttribute("thisMonth", thisMonth);
		
		//이전 년월의 마지막 일자를 뽑아서 이번 년월의 1일 앞에 붙여준다
		int lastYear = yy;
		int lastMonth = MM - 1;
		int nextYear = yy;
		int nextMonth = MM + 1;
		
		if(lastMonth == -1) {
			lastYear--;
			lastMonth = 11;
		}
		if(nextMonth == 12) {
			nextYear++;
			nextMonth = 0;
		}
		
		// 현재월의 이전월에 해당하는 마지막 날짜를 구한다.
		calToday.set(lastYear, lastMonth, 1);
		int lastLastDay = calToday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		// 다음월의 1일에 해당하는 요일을 숫자로 구한다.
		calToday.set(nextYear, nextMonth, 1);
		int nextStartWeek = calToday.get(Calendar.DAY_OF_WEEK);
		
		request.setAttribute("lastYear", lastYear);
		request.setAttribute("lastMonth", lastMonth);
		request.setAttribute("lastLastDay", lastLastDay);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		request.setAttribute("nextStartWeek", nextStartWeek);
	}

}
