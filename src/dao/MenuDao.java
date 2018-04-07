package dao;

import java.util.ArrayList;

import model.Menu;

public class MenuDao {
	public static ArrayList<Menu> getMenuList() {
		ArrayList<Menu> lstM = new ArrayList<>();
		lstM.add(new Menu("Home", "#home"));
		lstM.add(new Menu("My Work", "#work"));
		lstM.add(new Menu("Portfolio", "#portfolio"));
		lstM.add(new Menu("Resume", "#resume"));
		lstM.add(new Menu("About", "#about"));
		lstM.add(new Menu("Contact", "#contact"));
		lstM.add(new Menu("Exercises", "exercises.jsp"));
		return lstM;
	}
}
