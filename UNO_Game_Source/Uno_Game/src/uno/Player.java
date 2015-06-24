package uno;
import java.util.ArrayList;


public class Player {

	ArrayList<Card> cardsInHand;

	public Player() {
		this.cardsInHand = new ArrayList<Card>();
	}
	
	public void addCards(ArrayList<Card> cards){
		this.cardsInHand.addAll(cards);
	}
	
	public void addCard(Card c){
		this.cardsInHand.add(c);
	}
	
	public void dropCard(Card c){
		this.cardsInHand.remove(c);
	}
	
	public boolean isWinner(){
		return cardsInHand.isEmpty();
	}
	
}
