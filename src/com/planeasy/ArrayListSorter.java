package com.planeasy;

import java.util.ArrayList;
import java.util.Collections;

public class ArrayListSorter {
	ArrayList<TaskBean> arrayList = new ArrayList<TaskBean>();
	
	public ArrayListSorter(ArrayList<TaskBean> arrayList) {
		this.arrayList = arrayList;
	}
	
	public ArrayList<TaskBean> getSortedListByStartTime() {
		Collections.sort(arrayList);
		return arrayList;
	}

}
