package peti;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public interface ISubject {
	public void register(IObserver o);
	public void unregister(IObserver o);
	public void notifyObserver() throws IOException;

}

class SlijedBrojeva implements ISubject {
	private List<Integer> kolekcija;
	private IIzvorBrojeva izvor;
	private List<IObserver> observers;

	public SlijedBrojeva(IIzvorBrojeva noviIzvor) {
		this.izvor = noviIzvor;
		kolekcija = new ArrayList<>();
		observers = new ArrayList<>();
	}

	public void setIzvor(IIzvorBrojeva izvor) {
		this.izvor = izvor;
	}

	public List<Integer> getKolekcija() {
		return kolekcija;
	}
	
	void kreni() {
		int i=0;
		try {
			i = izvor.getInt();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		while(i != -1) {
			kolekcija.add(i);
			try {
				notifyObserver();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			try {
				i = izvor.getInt();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void register(IObserver o) {
		observers.add(o);
	}

	public void unregister(IObserver o) {
		observers.remove(o);
	}

	public void notifyObserver() throws IOException {
		for (IObserver o : observers ) {
			o.update();
		}
	}
	
}