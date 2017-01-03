generic
	type T is private;
	with function ">" (aA, aB: T) return Boolean;
package tri is
	type Tab is array(integer range <>) of T;

	procedure triParInsertion(A: in out Tab; compteurTests: in out integer);

end tri;

