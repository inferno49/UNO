package uno;
import java.util.ArrayList;



public class Game {

	public static int numberOfPlayers;
	public static Player[] players;
	public static ArrayList<Card> cardsStack;
	public  static Card topCard;
	public  int cardsPerPlayer =7;
	
	public  static void createCardStack() {
		double numberOfStacks = Math.ceil(2/2);
		cardsStack = new ArrayList<Card>();
		while(numberOfStacks>0){
			cardsStack.addAll(new Deck().getCards());
			--numberOfStacks;
		}
	}


	public ArrayList<Card> distributeCards(Player p1) {
		cardsPerPlayer=7;
		while(cardsPerPlayer>0){
				int index = (int)(Math.random()*cardsStack.size());
				p1.cardsInHand.add(cardsStack.remove(index));
			
			--cardsPerPlayer;
		}	
		return (p1.cardsInHand);
	}
	
	// gets the top card
public  Card gettop()
{
	int index = (int)(Math.random()*cardsStack.size());	
	topCard = cardsStack.remove(index);	
	return(topCard);
}
public ArrayList<Card> AddCard(ArrayList<Card> sl)
{  
	
	 int index = (int)(Math.random()*cardsStack.size());
	 Card newcard = cardsStack.remove(index);	
	   sl.add(newcard);
	   return sl;	
	
}
// creates a new player
	private Player createPlayers() {
		Player player = new Player();
		return player;
	}
	
	// Distribute cards to new Player
	  public ArrayList<Card> SeeCards(){
		  
		  Player p1 = createPlayers();
		  createCardStack();
		  ArrayList<Card> sl = new ArrayList<Card>();
		  sl = distributeCards(p1);
		 
		  return(sl);
		
	    	}
	    	
	  }
	  

	
	
	
	

