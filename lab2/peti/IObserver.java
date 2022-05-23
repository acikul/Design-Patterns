package peti;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public interface IObserver {
	public void update() throws IOException;
}

class ToTxtFilePlusDate implements IObserver {
	private SlijedBrojeva slijedBrojeva;
	
	public ToTxtFilePlusDate(ISubject slijedBrojeva) {
		super();
		this.slijedBrojeva = (SlijedBrojeva)slijedBrojeva;
		
		slijedBrojeva.register(this);
	}
	
	public void update() throws IOException {
		
		String zapisPathString= System.getProperty("user.dir") + "/zapis";
		Path zapisPath = Paths.get(zapisPathString);
		File zapis = new File(zapisPathString);
		Files.deleteIfExists(zapisPath);
		zapis.createNewFile();
		
		Date datum = new Date();
		FileWriter w = new FileWriter(zapis);
		w.write(datum.toString() + "\n");
		for (int i : slijedBrojeva.getKolekcija()) {
			w.write(i+"\n");
		}
		w.close();
	}
	
}

class SumAll implements IObserver {
	private SlijedBrojeva slijedBrojeva;
	
	public SumAll(SlijedBrojeva slijedBrojeva) {
		super();
		this.slijedBrojeva = slijedBrojeva;

		slijedBrojeva.register(this);
	}

	public void update() {
		int suma = 0;
		for (int i : slijedBrojeva.getKolekcija()) {
			suma += i;
		}
		System.out.println("Zbroj svih brojeva u kolekciji je: " + suma);
	}
	
}

class AvgAll implements IObserver {
	private SlijedBrojeva slijedBrojeva;
	
	public AvgAll(SlijedBrojeva slijedBrojeva) {
		super();
		this.slijedBrojeva = slijedBrojeva;

		slijedBrojeva.register(this);
	}

	public void update() {
		int suma = 0;
		for (int i : slijedBrojeva.getKolekcija()) {
			suma += i;
		}
		System.out.println("Prosjek svih brojeva u kolekciji je: " + suma/slijedBrojeva.getKolekcija().size());
	}
	
}

class MedianAll implements IObserver {
	private SlijedBrojeva slijedBrojeva;
	
	public MedianAll(SlijedBrojeva slijedBrojeva) {
		super();
		this.slijedBrojeva = slijedBrojeva;

		slijedBrojeva.register(this);
	}

	public void update() {
		double m = 0;
		List<Integer> tempKolekcija = slijedBrojeva.getKolekcija();
		Collections.sort(tempKolekcija);
		int n = tempKolekcija.size();
		if (n%2 == 1) {
			m = tempKolekcija.get((n+1)/2-1);
		} else {
			m = (tempKolekcija.get(n/2)+tempKolekcija.get(n/2-1))/2;
		}
		System.out.println("Medijan svih brojeva u kolekciji je: " + m);
	}
}