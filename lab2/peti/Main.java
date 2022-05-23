package peti;

//import java.io.IOException;

public class Main {

	@SuppressWarnings("unused")
	public static void main(String[] args) {
		IIzvorBrojeva izvor = new DatotecniIzvor("brojevi");
		SlijedBrojeva slijedBrojeva = new SlijedBrojeva(izvor);
		
		ToTxtFilePlusDate toTxtFileObserver = new ToTxtFilePlusDate(slijedBrojeva);
		SumAll sumAllObserver = new SumAll(slijedBrojeva);
		AvgAll avgAllObserver = new AvgAll(slijedBrojeva);
		MedianAll medAllObserver = new MedianAll(slijedBrojeva);
		slijedBrojeva.kreni();
		
		IIzvorBrojeva izvor2 = new TipkovnickiIzvor();
		SlijedBrojeva slijedBrojeva2 = new SlijedBrojeva(izvor2);
		ToTxtFilePlusDate toTxtFileObserver2 = new ToTxtFilePlusDate(slijedBrojeva2);
		SumAll sumAllObserver2 = new SumAll(slijedBrojeva2);
		AvgAll avgAllObserver2 = new AvgAll(slijedBrojeva2);
		MedianAll medAllObserver2 = new MedianAll(slijedBrojeva2);
		slijedBrojeva2.kreni();
	}
}
