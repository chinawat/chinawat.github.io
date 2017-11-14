public class Symbol<E extends Comparable <? super E>> implements Comparable<Symbol<E>>{
  private double frequency;
  private char c;
  public Symbol(double freq, char c){
    this.c = c;
    this.frequency = freq;
  }
  public double getFreq(){return frequency;}
  public char getC(){return c;}

  //Throws ClassCastException when param isn't Symbol
  public int compareTo(Symbol<E> o){
    Symbol<E> s = (Symbol<E>)o;
    return (int)(this.frequency - s.frequency);
  }
}