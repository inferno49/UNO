package uno;
import java.util.ArrayList;


public class Deck {

	ArrayList<Card> cards;
	
	public Deck() {

		cards = new ArrayList<Card>();

//		initiate the numbered cards
		for(int i = 0; i < 10; i++){
			cards.add(new Card(i, CardColor.Blue, SpecialCardType.NONE));
			cards.add(new Card(i, CardColor.Green, SpecialCardType.NONE));
			cards.add(new Card(i, CardColor.Red, SpecialCardType.NONE));
			cards.add(new Card(i, CardColor.Yellow, SpecialCardType.NONE));
		}
		
//		initial +2s
	/*	cards.add(new Card(CardColor.Blue, SpecialCardType.PLUS_2));
		cards.add(new Card(CardColor.Green, SpecialCardType.PLUS_2));
		cards.add(new Card(CardColor.Red, SpecialCardType.PLUS_2));
		cards.add(new Card(CardColor.Yellow, SpecialCardType.PLUS_2));
		
//		initiate +4s
		cards.add(new Card(CardColor.Wild, SpecialCardType.PLUS_4));
		cards.add(new Card(CardColor.Wild, SpecialCardType.PLUS_4));
		
//		initiate Wild Cards
		cards.add(new Card(CardColor.Wild, SpecialCardType.NONE));
		cards.add(new Card(CardColor.Wild, SpecialCardType.NONE));
		
//		initiate Reverse cards
		cards.add(new Card(CardColor.Blue, SpecialCardType.REVERSE));
		cards.add(new Card(CardColor.Green, SpecialCardType.REVERSE));
		cards.add(new Card(CardColor.Red, SpecialCardType.REVERSE));
		cards.add(new Card(CardColor.Yellow, SpecialCardType.REVERSE));
		
//		initiate Skips
		cards.add(new Card(CardColor.Blue, SpecialCardType.SKIP));
		cards.add(new Card(CardColor.Green, SpecialCardType.SKIP));
		cards.add(new Card(CardColor.Red, SpecialCardType.SKIP));
		cards.add(new Card(CardColor.Yellow, SpecialCardType.SKIP)); */
		
	}
	
	public ArrayList<Card> getCards(){
		return cards;
	}
	
}
