package peti;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

public interface IIzvorBrojeva {
	int getInt() throws IOException;
}

class TipkovnickiIzvor implements IIzvorBrojeva {

	public int getInt() {
		@SuppressWarnings("resource")
		Scanner skener = new Scanner(System.in);
		
		System.out.println("Unos broja: ");
		if(skener.hasNextInt()) {
			int i = skener.nextInt();
			return i;
		}
		return -1;
	}
}

class DatotecniIzvor implements IIzvorBrojeva {
	
	String datotekaPathString;
	BufferedReader reader;
	Scanner skener;
	
	public DatotecniIzvor(String fileName) {
		
		datotekaPathString = System.getProperty("user.dir") + "/" + fileName;
		try {
			skener = new Scanner(new File(datotekaPathString));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
	}

	public int getInt() throws IOException {
		if (skener.hasNextInt()) {
			return skener.nextInt();
		} else {
			return -1;
		}
	}
}