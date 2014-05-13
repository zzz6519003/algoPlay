/* though it's not written by me.......*/
/*
http://www.snakedj.ch/2010/09/13/swi-prolog-sudoku-solver/
*/

:- use_module(library(clpfd)).
 
sudoku([A1,A2,A3, A4,A5,A6, A7,A8,A9,
       B1,B2,B3, B4,B5,B6, B7,B8,B9,
       C1,C2,C3, C4,C5,C6, C7,C8,C9,
 
       D1,D2,D3, D4,D5,D6, D7,D8,D9,
       E1,E2,E3, E4,E5,E6, E7,E8,E9,
       F1,F2,F3, F4,F5,F6, F7,F8,F9,
 
       G1,G2,G3, G4,G5,G6, G7,G8,G9,
       H1,H2,H3, H4,H5,H6, H7,H8,H9,
       I1,I2,I3, I4,I5,I6, I7,I8,I9]) :-
 
       valid([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
       valid([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
       valid([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
       valid([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
       valid([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
       valid([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
       valid([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
       valid([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
       valid([I1,I2,I3,I4,I5,I6,I7,I8,I9]),
 
       valid([A1,B1,C1,D1,E1,F1,G1,H1,I1]),
       valid([A2,B2,C2,D2,E2,F2,G2,H2,I2]),
       valid([A3,B3,C3,D3,E3,F3,G3,H3,I3]),
       valid([A4,B4,C4,D4,E4,F4,G4,H4,I4]),
       valid([A5,B5,C5,D5,E5,F5,G5,H5,I5]),
       valid([A6,B6,C6,D6,E6,F6,G6,H6,I6]),
       valid([A7,B7,C7,D7,E7,F7,G7,H7,I7]),
       valid([A8,B8,C8,D8,E8,F8,G8,H8,I8]),
       valid([A9,B9,C9,D9,E9,F9,G9,H9,I9]),
 
       valid([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
       valid([A4,A5,A6,B4,B5,B6,C4,C5,C6]),
       valid([A7,A8,A9,B7,B8,B9,C7,C8,C9]),
       valid([D1,D2,D3,E1,E2,E3,F1,F2,F3]),
       valid([D4,D5,D6,E4,E5,E6,F4,F5,F6]),
       valid([D7,D8,D9,E7,E8,E9,F7,F8,F9]),
       valid([G1,G2,G3,H1,H2,H3,I1,I2,I3]),
       valid([G4,G5,G6,H4,H5,H6,I4,I5,I6]),
       valid([G7,G8,G9,H7,H8,H9,I7,I8,I9]),
 
       labeling([ff],[A1,A2,A3,A4,A5,A6,A7,A8,A9,
                    B1,B2,B3,B4,B5,B6,B7,B8,B9,
                    C1,C2,C3,C4,C5,C6,C7,C8,C9,
                    D1,D2,D3,D4,D5,D6,D7,D8,D9,
                    E1,E2,E3,E4,E5,E6,E7,E8,E9,
                    F1,F2,F3,F4,F5,F6,F7,F8,F9,
                    G1,G2,G3,G4,G5,G6,G7,G8,G9,
                    H1,H2,H3,H4,H5,H6,H7,H8,H9,
                    I1,I2,I3,I4,I5,I6,I7,I8,I9]),
 
       print_sudoku([A1,A2,A3,A4,A5,A6,A7,A8,A9,
                  B1,B2,B3,B4,B5,B6,B7,B8,B9,
                  C1,C2,C3,C4,C5,C6,C7,C8,C9]),
       print_line,
       print_sudoku([D1,D2,D3,D4,D5,D6,D7,D8,D9,
                  E1,E2,E3,E4,E5,E6,E7,E8,E9,
                  F1,F2,F3,F4,F5,F6,F7,F8,F9]),
       print_line,
       print_sudoku([G1,G2,G3,G4,G5,G6,G7,G8,G9,
                  H1,H2,H3,H4,H5,H6,H7,H8,H9,
                  I1,I2,I3,I4,I5,I6,I7,I8,I9]).
 
 
valid(L) :-
    length(L,9),
    L ins 1..9,
    all_different(L).
 
print_sudoku([]).
print_sudoku([R1,R2,R3,R4,R5,R6,R7,R8,R9|B]) :-
    format('~d ~d ~d | ~d ~d ~d | ~d ~d ~d \n',[R1,R2,R3,R4,R5,R6,R7,R8,R9]),
    print_sudoku(B).

print_line :- format('------+-------+------\n',[]).

herald :-
    sudoku([7,_,_,_,4,3,_,_,_,
            _,1,_,7,_,_,6,_,_,
            _,4,_,_,1,_,_,_,2,
            _,_,_,_,_,_,4,1,_,
            _,_,7,1,_,9,5,_,_,
            _,6,5,_,_,_,_,_,_,
            2,_,_,_,6,_,_,8,_,
            _,_,4,_,_,8,_,9,_,
            _,_,_,9,2,_,_,_,6]).
