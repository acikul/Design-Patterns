package sesti;

import java.util.ArrayList;
import java.util.Deque;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class Sheet {
	Cell tablica[][];
	private int retci, stupci;
	
 	public Sheet(int retci, int stupci) {
 		this.retci = retci;
 		this.stupci = stupci;
		this.tablica = new Cell[retci][stupci];
		for (int i = 0; i < retci; i++) {
			for (int j = 0; j < stupci; j++) {
				this.tablica[i][j] = new Cell(this);
			}
		}
	}
	
	public Cell cell(String ref) {
		int redak = ref.charAt(0)%65;
		int stupac = Character.getNumericValue(ref.charAt(1))-1;
		if(redak > this.tablica.length || stupac > this.tablica[0].length) {
			throw new IndexOutOfBoundsException("redak ili stupac index prevelik");
		}
		return this.tablica[redak][stupac];
	}
	
	public void set(String ref, String content) {
		
		//zamjena exp-a
		int redak = ref.charAt(0)%65;
		int stupac = Character.getNumericValue(ref.charAt(1))-1;
		if(redak > this.tablica.length || stupac > this.tablica[0].length) {
			throw new IndexOutOfBoundsException("redak ili stupac index prevelik");
		}
		this.tablica[redak][stupac].exp = content;
		
		Cell settirana = this.tablica[redak][stupac];
		this.evaluate(settirana);
		for (Cell njenaReferenca : this.getrefs(settirana)) {
			njenaReferenca.register(settirana);
		}
		settirana.notifyObservers();
	}
	
	public List<Cell> getrefs(Cell cell) {
		List<Cell> listaRefs = new ArrayList<>();
		String strArr[] = cell.exp.split("\\+");
		
		if (strArr.length > 1) {
			for (String s : strArr) {
				listaRefs.add(this.cell(s));
			}
		} else {
			try {
				@SuppressWarnings("unused")
				int i = Integer.parseInt(strArr[0]);
			} catch (NumberFormatException nfe) {
				if (strArr[0].length() != 0) {
					listaRefs.add(this.cell(strArr[0]));
				}
			}
		}
		return listaRefs;
	}
	
	public boolean isCircular(Cell pocetna) {
		Deque<Cell> open = new LinkedList<>();
		Set<Cell> vecVideno = new HashSet<>();
		
		open.add(pocetna);
		boolean pocetak = true;
		
		while (!open.isEmpty()) {
			Cell current = open.removeFirst();
			if (pocetak) {
				pocetak = false;
			} else {
				if (current.equals(pocetna)) {
					throw new RuntimeException("Cirkularna ovisnost");
				}
			}
			List<Cell> succList = this.getrefs(current);
			
			for (Cell ref : succList) {
				if (!vecVideno.contains(ref)) {
					open.addLast(ref);
					vecVideno.add(ref);
				}
			}
		}
		return false;
	}
	
	public int evaluate(Cell cell) {
		try {
			cell.value = Integer.parseInt(cell.exp.split("\\+")[0]);
		} catch (NumberFormatException nfe) {
			cell.value = 0;
			if (!this.isCircular(cell)) {
				for (Cell referenca : this.getrefs(cell)) {
					cell.value += evaluate(referenca);
				}
			}
		}
		return cell.value;
	}
	
	public void printOut() {
		for (int i = 0; i < this.retci; i++) {
			for (int j = 0; j < this.stupci; j++) {
				System.out.printf("%-5s", this.tablica[i][j].value);
			}
			System.out.printf("\n");
		}
		System.out.printf("\n\n");
	}
	
	public static void main(String[] args) {
		Sheet s = new Sheet(5,5);
		s.set("A1", "2");
		s.set("B2", "7");
		
		s.set("A2", "A1+B2");
		s.set("A3", "A1+A1+A1");
		
		s.set("A1", "4");
		s.set("B2", "A1");
		s.set("A1", "B2");

	}

}
