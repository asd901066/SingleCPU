
module Mux_for_MultiDetection( en_B1, en_M2, en_H3, en_Branch, en_Mult, en_HD, nothing, Signal_of_Detection  );

    input en_B1, en_M2, en_H3;
    input  [2:0] en_Branch, en_Mult, en_HD, nothing;
    output [2:0] Signal_of_Detection ;

    assign Signal_of_Detection = ({en_B1,en_M2,en_H3}==3'b001) ? en_HD :
								 ({en_B1,en_M2,en_H3}==3'b010) ? en_Mult :
								 ({en_B1,en_M2,en_H3}==3'b100) ? en_Branch : nothing ;
								 
								 
endmodule