package sesti;

import java.util.ArrayList;
import java.util.List;

public class Cell implements IObserver, ISubject{
	String exp;
	int value;
	
	private List<IObserver> observers;
	private Sheet sheet;
	
	public Cell(Sheet sheet) {
		super();
		this.exp = "";
		this.value = 0;
		this.observers = new ArrayList<>();
		this.sheet = sheet;
	}
	
	public void register(IObserver o) {
//		observers.clear();
		observers.add(o);
	}

	public void unregister(IObserver o) {
		observers.remove(o);
	}

	public void notifyObservers() {
		for (IObserver o : observers ) {
			o.update();
		}
	}

	public void update() {
		sheet.evaluate(this);
		sheet.printOut();
	}
	
	

	@Override
	public String toString() {
		return "exp: " + exp + ", value: " + value; 
	}
}
