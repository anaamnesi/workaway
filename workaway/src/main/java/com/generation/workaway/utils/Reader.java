package com.generation.workaway.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public abstract class Reader {

 
		
		public static Map<String,String> readDescr(String percorso){
			Map<String,String>map = new HashMap<>();
			Scanner dati = null;
			try {
				dati = new Scanner(new File(percorso));
				
				while(dati.hasNextLine()) {
				// dubai chiave, descrizione valore.	
					String ris = dati.nextLine();
				//	System.out.println("ris "+ ris);
					map.put(ris.split("--")[0], ris.split("--")[1]);
						
					
					
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				System.out.println("controlla il percorso del file");
			}
			if(dati != null)
				dati.close();
			return map;
		}
		
}//fine classe
	

