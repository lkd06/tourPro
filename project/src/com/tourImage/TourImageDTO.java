package com.tourImage;

public class TourImageDTO {

		private String id;
		private int num;
		private String fileName;
		private String created; //+
		private String name;
		//--------------------------------
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public String getCreated() {
			return created;
		}
		public void setCreated(String created) {
			this.created = created;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
		
}
