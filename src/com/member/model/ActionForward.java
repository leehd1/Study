package com.member.model;

	public class ActionForward {
		//페이지 이동 방식 여부 값 저장 변수
		private boolean isRedirect=false; 
		//true sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		//false  forward() <- 이방식은 이동할 페이지 주소 경로 노출 안함.
		
		//이동페이지 경로 주소값 저장 변수
		private String path = null;
		
		//페이지 이동 방식 여부 값 리턴
		public boolean isRedirect() {
			return isRedirect;
		}
		//페이지 이동 방식 여부 값 저장 메소드 
		public void setRedirect(boolean isRedirect) {
			this.isRedirect = isRedirect;
		}
		//이동페이지 경로 주소값 리턴 메소드 
		public String getPath() {
			return path;
		}
		//이동할 페이지 경로 주소값 저장
		public void setPath(String path) {
			this.path = path;
		}	
	
}
