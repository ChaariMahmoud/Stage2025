(set-option :print-success false)
(set-info :smt-lib-version 2.6)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun real_to_bool (Real) Bool)
(declare-fun bool_to_real (Bool) Real)
(declare-fun MAX_REQUESTS () Real)
(assert (forall ((r Real) ) (! (= (= (real_to_bool r) false) (= r 0.0))
 :qid |requestbpl.19:15|
 :skolemid |4|
 :pattern ( (real_to_bool r))
)))
(assert (forall ((r@@0 Real) ) (! (= (real_to_bool r@@0) (ite (= r@@0 0.0) false true))
 :qid |requestbpl.10:23|
 :skolemid |1|
 :pattern ( (real_to_bool r@@0))
)))
(assert (forall ((b Bool) ) (! (= (real_to_bool (bool_to_real b)) b)
 :qid |requestbpl.17:15|
 :skolemid |3|
 :pattern ( (real_to_bool (bool_to_real b)))
)))
(assert (forall ((b@@0 Bool) ) (! (= (bool_to_real b@@0) (ite b@@0 1.0 0.0))
 :qid |requestbpl.6:23|
 :skolemid |0|
 :pattern ( (bool_to_real b@@0))
)))
(assert (forall ((b@@1 Bool) ) (!  (or (= (bool_to_real b@@1) 0.0) (= (bool_to_real b@@1) 1.0))
 :qid |requestbpl.15:15|
 :skolemid |2|
 :pattern ( (bool_to_real b@@1))
)))
(assert (= MAX_REQUESTS 10.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun $sp@36 () Int)
(declare-fun $sp@35 () Int)
(declare-fun $sp@34 () Int)
(declare-fun $stack@18 () (Array Int Real))
(declare-fun inline$acquire_request$0$loc2@2 () Real)
(declare-fun $stack@17 () (Array Int Real))
(declare-fun $sp@33 () Int)
(declare-fun $stack@16 () (Array Int Real))
(declare-fun inline$popArgs1$5$a1@2 () Real)
(declare-fun $sp@32 () Int)
(declare-fun $sp@23 () Int)
(declare-fun $stack@11 () (Array Int Real))
(declare-fun $tmp1@5 () Real)
(declare-fun $sp@31 () Int)
(declare-fun $stack@15 () (Array Int Real))
(declare-fun inline$popArgs1$4$a1@2 () Real)
(declare-fun $sp@30 () Int)
(declare-fun $sp@29 () Int)
(declare-fun $stack@14 () (Array Int Real))
(declare-fun $sp@28 () Int)
(declare-fun inline$popArgs1$3$a1@2 () Real)
(declare-fun $sp@27 () Int)
(declare-fun inline$push$13$val@1 () Real)
(declare-fun $stack@13 () (Array Int Real))
(declare-fun $tmp2@4 () Real)
(declare-fun $tmp1@6 () Real)
(declare-fun $sp@26 () Int)
(declare-fun $sp@25 () Int)
(declare-fun $sp@24 () Int)
(declare-fun $stack@12 () (Array Int Real))
(declare-fun inline$popArgs1$2$a1@2 () Real)
(declare-fun $sp@22 () Int)
(declare-fun $sp@21 () Int)
(declare-fun inline$push$10$val@1 () Real)
(declare-fun $stack@10 () (Array Int Real))
(declare-fun $tmp2@3 () Real)
(declare-fun $tmp1@4 () Real)
(declare-fun $sp@20 () Int)
(declare-fun $sp@19 () Int)
(declare-fun $sp@18 () Int)
(declare-fun $stack@9 () (Array Int Real))
(declare-fun $sp@17 () Int)
(declare-fun $stack@8 () (Array Int Real))
(declare-fun $sp@16 () Int)
(declare-fun $sp@0 () Int)
(declare-fun active_requests@0 () Real)
(declare-fun $stack@0 () (Array Int Real))
(declare-fun c@1 () Int)
(declare-fun $sp@15 () Int)
(declare-fun $sp@14 () Int)
(declare-fun $sp@13 () Int)
(declare-fun $stack@7 () (Array Int Real))
(declare-fun inline$popArgs1$1$a1@2 () Real)
(declare-fun $sp@12 () Int)
(declare-fun inline$push$6$val@1 () Real)
(declare-fun $stack@6 () (Array Int Real))
(declare-fun $tmp2@2 () Real)
(declare-fun $tmp1@3 () Real)
(declare-fun $sp@11 () Int)
(declare-fun $sp@10 () Int)
(declare-fun $sp@9 () Int)
(declare-fun $stack@5 () (Array Int Real))
(declare-fun $sp@8 () Int)
(declare-fun inline$popArgs1$0$a1@2 () Real)
(declare-fun $stack@4 () (Array Int Real))
(declare-fun $tmp1@2 () Real)
(declare-fun $sp@7 () Int)
(declare-fun $sp@6 () Int)
(declare-fun inline$push$3$val@1 () Real)
(declare-fun $stack@3 () (Array Int Real))
(declare-fun $tmp2@1 () Real)
(declare-fun $tmp1@1 () Real)
(declare-fun $sp@5 () Int)
(declare-fun $sp@4 () Int)
(declare-fun $sp@3 () Int)
(declare-fun $stack@2 () (Array Int Real))
(declare-fun $sp@2 () Int)
(declare-fun $stack@1 () (Array Int Real))
(declare-fun $sp@1 () Int)
(set-info :boogie-vc-id BoogieEntry_request)
(set-option :timeout 0)
(set-option :rlimit 0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
(assert (not
 (=> (= (ControlFlow 0 0) 297) (let ((anon5_Then$2_correct  (=> (= (ControlFlow 0 124) (- 0 123)) (<= 0 $sp@36))))
(let ((inline$popDiscard1$0$Return_correct  (and (=> (= (ControlFlow 0 125) (- 0 127)) (= $sp@36 (- $sp@35 1))) (=> (= $sp@36 (- $sp@35 1)) (and (=> (= (ControlFlow 0 125) (- 0 126)) (<= 0 $sp@36)) (=> (<= 0 $sp@36) (=> (= (ControlFlow 0 125) 124) anon5_Then$2_correct)))))))
(let ((inline$popDiscard1$0$anon0_correct  (=> (and (= $sp@36 (- $sp@35 1)) (= (ControlFlow 0 128) 125)) inline$popDiscard1$0$Return_correct)))
(let ((inline$popDiscard1$0$Entry_correct  (and (=> (= (ControlFlow 0 129) (- 0 130)) (>= $sp@35 1)) (=> (>= $sp@35 1) (=> (= (ControlFlow 0 129) 128) inline$popDiscard1$0$anon0_correct)))))
(let ((inline$push$15$Return_correct  (and (=> (= (ControlFlow 0 131) (- 0 135)) (= $sp@35 (+ $sp@34 1))) (=> (= $sp@35 (+ $sp@34 1)) (and (=> (= (ControlFlow 0 131) (- 0 134)) (= (select $stack@18 $sp@34) inline$acquire_request$0$loc2@2)) (=> (= (select $stack@18 $sp@34) inline$acquire_request$0$loc2@2) (and (=> (= (ControlFlow 0 131) (- 0 133)) (forall ((inline$push$15$i Int) ) (!  (=> (not (= inline$push$15$i $sp@34)) (= (select $stack@18 inline$push$15$i) (select $stack@17 inline$push$15$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$15$i@@0 Int) ) (!  (=> (not (= inline$push$15$i@@0 $sp@34)) (= (select $stack@18 inline$push$15$i@@0) (select $stack@17 inline$push$15$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 131) (- 0 132)) (<= 0 $sp@35)) (=> (<= 0 $sp@35) (=> (= (ControlFlow 0 131) 129) inline$popDiscard1$0$Entry_correct)))))))))))
(let ((inline$push$15$anon0_correct  (=> (= $stack@18 (store $stack@17 $sp@34 inline$acquire_request$0$loc2@2)) (=> (and (= $sp@35 (+ $sp@34 1)) (= (ControlFlow 0 136) 131)) inline$push$15$Return_correct))))
(let ((inline$push$15$Entry_correct  (and (=> (= (ControlFlow 0 137) (- 0 138)) (<= 0 $sp@34)) (=> (<= 0 $sp@34) (=> (= (ControlFlow 0 137) 136) inline$push$15$anon0_correct)))))
(let ((inline$acquire_request$0$anon4_Then$2_correct  (=> (and (and (= $sp@34 $sp@33) (= $stack@17 $stack@16)) (and (= inline$acquire_request$0$loc2@2 inline$popArgs1$5$a1@2) (= (ControlFlow 0 205) 137))) inline$push$15$Entry_correct)))
(let ((inline$popArgs1$5$Return_correct  (and (=> (= (ControlFlow 0 206) (- 0 210)) (= $sp@33 (- $sp@32 1))) (=> (= $sp@33 (- $sp@32 1)) (and (=> (= (ControlFlow 0 206) (- 0 209)) (<= 0 $sp@33)) (=> (<= 0 $sp@33) (and (=> (= (ControlFlow 0 206) (- 0 208)) (forall ((inline$popArgs1$5$i Int) ) (! (= (select $stack@16 inline$popArgs1$5$i) (select $stack@16 inline$popArgs1$5$i))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (forall ((inline$popArgs1$5$i@@0 Int) ) (! (= (select $stack@16 inline$popArgs1$5$i@@0) (select $stack@16 inline$popArgs1$5$i@@0))
 :qid |unknown.0:0|
 :skolemid |9|
)) (and (=> (= (ControlFlow 0 206) (- 0 207)) (= inline$popArgs1$5$a1@2 (select $stack@16 (- $sp@32 1)))) (=> (= inline$popArgs1$5$a1@2 (select $stack@16 (- $sp@32 1))) (=> (= (ControlFlow 0 206) 205) inline$acquire_request$0$anon4_Then$2_correct)))))))))))
(let ((inline$popArgs1$5$anon0_correct  (=> (= $sp@33 (- $sp@32 1)) (=> (and (= inline$popArgs1$5$a1@2 (select $stack@16 $sp@33)) (= (ControlFlow 0 211) 206)) inline$popArgs1$5$Return_correct))))
(let ((inline$popArgs1$5$Entry_correct  (and (=> (= (ControlFlow 0 212) (- 0 213)) (>= $sp@32 1)) (=> (>= $sp@32 1) (=> (= (ControlFlow 0 212) 211) inline$popArgs1$5$anon0_correct)))))
(let ((inline$push$16$Return_correct  (and (=> (= (ControlFlow 0 214) (- 0 218)) (= $sp@32 (+ $sp@23 1))) (=> (= $sp@32 (+ $sp@23 1)) (and (=> (= (ControlFlow 0 214) (- 0 217)) (= (select $stack@16 $sp@23) 0.0)) (=> (= (select $stack@16 $sp@23) 0.0) (and (=> (= (ControlFlow 0 214) (- 0 216)) (forall ((inline$push$16$i Int) ) (!  (=> (not (= inline$push$16$i $sp@23)) (= (select $stack@16 inline$push$16$i) (select $stack@11 inline$push$16$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$16$i@@0 Int) ) (!  (=> (not (= inline$push$16$i@@0 $sp@23)) (= (select $stack@16 inline$push$16$i@@0) (select $stack@11 inline$push$16$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 214) (- 0 215)) (<= 0 $sp@32)) (=> (<= 0 $sp@32) (=> (= (ControlFlow 0 214) 212) inline$popArgs1$5$Entry_correct)))))))))))
(let ((inline$push$16$anon0_correct  (=> (= $stack@16 (store $stack@11 $sp@23 0.0)) (=> (and (= $sp@32 (+ $sp@23 1)) (= (ControlFlow 0 219) 214)) inline$push$16$Return_correct))))
(let ((inline$push$16$Entry_correct  (and (=> (= (ControlFlow 0 220) (- 0 221)) (<= 0 $sp@23)) (=> (<= 0 $sp@23) (=> (= (ControlFlow 0 220) 219) inline$push$16$anon0_correct)))))
(let ((inline$acquire_request$0$anon4_Then_correct  (=> (and (real_to_bool $tmp1@5) (= (ControlFlow 0 222) 220)) inline$push$16$Entry_correct)))
(let ((inline$acquire_request$0$anon4_Else$8_correct  (=> (and (and (= $sp@34 $sp@31) (= $stack@17 $stack@15)) (and (= inline$acquire_request$0$loc2@2 inline$popArgs1$4$a1@2) (= (ControlFlow 0 139) 137))) inline$push$15$Entry_correct)))
(let ((inline$popArgs1$4$Return_correct  (and (=> (= (ControlFlow 0 140) (- 0 144)) (= $sp@31 (- $sp@30 1))) (=> (= $sp@31 (- $sp@30 1)) (and (=> (= (ControlFlow 0 140) (- 0 143)) (<= 0 $sp@31)) (=> (<= 0 $sp@31) (and (=> (= (ControlFlow 0 140) (- 0 142)) (forall ((inline$popArgs1$4$i Int) ) (! (= (select $stack@15 inline$popArgs1$4$i) (select $stack@15 inline$popArgs1$4$i))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (forall ((inline$popArgs1$4$i@@0 Int) ) (! (= (select $stack@15 inline$popArgs1$4$i@@0) (select $stack@15 inline$popArgs1$4$i@@0))
 :qid |unknown.0:0|
 :skolemid |9|
)) (and (=> (= (ControlFlow 0 140) (- 0 141)) (= inline$popArgs1$4$a1@2 (select $stack@15 (- $sp@30 1)))) (=> (= inline$popArgs1$4$a1@2 (select $stack@15 (- $sp@30 1))) (=> (= (ControlFlow 0 140) 139) inline$acquire_request$0$anon4_Else$8_correct)))))))))))
(let ((inline$popArgs1$4$anon0_correct  (=> (= $sp@31 (- $sp@30 1)) (=> (and (= inline$popArgs1$4$a1@2 (select $stack@15 $sp@31)) (= (ControlFlow 0 145) 140)) inline$popArgs1$4$Return_correct))))
(let ((inline$popArgs1$4$Entry_correct  (and (=> (= (ControlFlow 0 146) (- 0 147)) (>= $sp@30 1)) (=> (>= $sp@30 1) (=> (= (ControlFlow 0 146) 145) inline$popArgs1$4$anon0_correct)))))
(let ((inline$push$14$Return_correct  (and (=> (= (ControlFlow 0 148) (- 0 152)) (= $sp@30 (+ $sp@29 1))) (=> (= $sp@30 (+ $sp@29 1)) (and (=> (= (ControlFlow 0 148) (- 0 151)) (= (select $stack@15 $sp@29) 1.0)) (=> (= (select $stack@15 $sp@29) 1.0) (and (=> (= (ControlFlow 0 148) (- 0 150)) (forall ((inline$push$14$i Int) ) (!  (=> (not (= inline$push$14$i $sp@29)) (= (select $stack@15 inline$push$14$i) (select $stack@14 inline$push$14$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$14$i@@0 Int) ) (!  (=> (not (= inline$push$14$i@@0 $sp@29)) (= (select $stack@15 inline$push$14$i@@0) (select $stack@14 inline$push$14$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 148) (- 0 149)) (<= 0 $sp@30)) (=> (<= 0 $sp@30) (=> (= (ControlFlow 0 148) 146) inline$popArgs1$4$Entry_correct)))))))))))
(let ((inline$push$14$anon0_correct  (=> (= $stack@15 (store $stack@14 $sp@29 1.0)) (=> (and (= $sp@30 (+ $sp@29 1)) (= (ControlFlow 0 153) 148)) inline$push$14$Return_correct))))
(let ((inline$push$14$Entry_correct  (and (=> (= (ControlFlow 0 154) (- 0 155)) (<= 0 $sp@29)) (=> (<= 0 $sp@29) (=> (= (ControlFlow 0 154) 153) inline$push$14$anon0_correct)))))
(let ((inline$popArgs1$3$Return_correct  (and (=> (= (ControlFlow 0 156) (- 0 160)) (= $sp@29 (- $sp@28 1))) (=> (= $sp@29 (- $sp@28 1)) (and (=> (= (ControlFlow 0 156) (- 0 159)) (<= 0 $sp@29)) (=> (<= 0 $sp@29) (and (=> (= (ControlFlow 0 156) (- 0 158)) (forall ((inline$popArgs1$3$i Int) ) (! (= (select $stack@14 inline$popArgs1$3$i) (select $stack@14 inline$popArgs1$3$i))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (forall ((inline$popArgs1$3$i@@0 Int) ) (! (= (select $stack@14 inline$popArgs1$3$i@@0) (select $stack@14 inline$popArgs1$3$i@@0))
 :qid |unknown.0:0|
 :skolemid |9|
)) (and (=> (= (ControlFlow 0 156) (- 0 157)) (= inline$popArgs1$3$a1@2 (select $stack@14 (- $sp@28 1)))) (=> (= inline$popArgs1$3$a1@2 (select $stack@14 (- $sp@28 1))) (=> (= (ControlFlow 0 156) 154) inline$push$14$Entry_correct)))))))))))
(let ((inline$popArgs1$3$anon0_correct  (=> (= $sp@29 (- $sp@28 1)) (=> (and (= inline$popArgs1$3$a1@2 (select $stack@14 $sp@29)) (= (ControlFlow 0 161) 156)) inline$popArgs1$3$Return_correct))))
(let ((inline$popArgs1$3$Entry_correct  (and (=> (= (ControlFlow 0 162) (- 0 163)) (>= $sp@28 1)) (=> (>= $sp@28 1) (=> (= (ControlFlow 0 162) 161) inline$popArgs1$3$anon0_correct)))))
(let ((inline$push$13$Return_correct  (and (=> (= (ControlFlow 0 164) (- 0 168)) (= $sp@28 (+ $sp@27 1))) (=> (= $sp@28 (+ $sp@27 1)) (and (=> (= (ControlFlow 0 164) (- 0 167)) (= (select $stack@14 $sp@27) inline$push$13$val@1)) (=> (= (select $stack@14 $sp@27) inline$push$13$val@1) (and (=> (= (ControlFlow 0 164) (- 0 166)) (forall ((inline$push$13$i Int) ) (!  (=> (not (= inline$push$13$i $sp@27)) (= (select $stack@14 inline$push$13$i) (select $stack@13 inline$push$13$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$13$i@@0 Int) ) (!  (=> (not (= inline$push$13$i@@0 $sp@27)) (= (select $stack@14 inline$push$13$i@@0) (select $stack@13 inline$push$13$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 164) (- 0 165)) (<= 0 $sp@28)) (=> (<= 0 $sp@28) (=> (= (ControlFlow 0 164) 162) inline$popArgs1$3$Entry_correct)))))))))))
(let ((inline$push$13$anon0_correct  (=> (= $stack@14 (store $stack@13 $sp@27 inline$push$13$val@1)) (=> (and (= $sp@28 (+ $sp@27 1)) (= (ControlFlow 0 169) 164)) inline$push$13$Return_correct))))
(let ((inline$push$13$Entry_correct  (=> (= inline$push$13$val@1 (+ $tmp2@4 $tmp1@6)) (and (=> (= (ControlFlow 0 170) (- 0 171)) (<= 0 $sp@27)) (=> (<= 0 $sp@27) (=> (= (ControlFlow 0 170) 169) inline$push$13$anon0_correct))))))
(let ((inline$popToTmp2$3$Return_correct  (and (=> (= (ControlFlow 0 172) (- 0 176)) (= $sp@27 (- $sp@26 1))) (=> (= $sp@27 (- $sp@26 1)) (and (=> (= (ControlFlow 0 172) (- 0 175)) (forall ((inline$popToTmp2$3$i Int) ) (! (= (select $stack@13 inline$popToTmp2$3$i) (select $stack@13 inline$popToTmp2$3$i))
 :qid |unknown.0:0|
 :skolemid |7|
))) (=> (forall ((inline$popToTmp2$3$i@@0 Int) ) (! (= (select $stack@13 inline$popToTmp2$3$i@@0) (select $stack@13 inline$popToTmp2$3$i@@0))
 :qid |unknown.0:0|
 :skolemid |7|
)) (and (=> (= (ControlFlow 0 172) (- 0 174)) (= $tmp2@4 (select $stack@13 (- $sp@26 1)))) (=> (= $tmp2@4 (select $stack@13 (- $sp@26 1))) (and (=> (= (ControlFlow 0 172) (- 0 173)) (<= 0 $sp@27)) (=> (<= 0 $sp@27) (=> (= (ControlFlow 0 172) 170) inline$push$13$Entry_correct)))))))))))
(let ((inline$popToTmp2$3$anon0_correct  (=> (= $sp@27 (- $sp@26 1)) (=> (and (= $tmp2@4 (select $stack@13 $sp@27)) (= (ControlFlow 0 177) 172)) inline$popToTmp2$3$Return_correct))))
(let ((inline$popToTmp2$3$Entry_correct  (and (=> (= (ControlFlow 0 178) (- 0 179)) (> $sp@26 0)) (=> (> $sp@26 0) (=> (= (ControlFlow 0 178) 177) inline$popToTmp2$3$anon0_correct)))))
(let ((inline$popToTmp1$5$Return_correct  (and (=> (= (ControlFlow 0 180) (- 0 184)) (= $sp@26 (- $sp@25 1))) (=> (= $sp@26 (- $sp@25 1)) (and (=> (= (ControlFlow 0 180) (- 0 183)) (forall ((inline$popToTmp1$5$i Int) ) (! (= (select $stack@13 inline$popToTmp1$5$i) (select $stack@13 inline$popToTmp1$5$i))
 :qid |unknown.0:0|
 :skolemid |6|
))) (=> (forall ((inline$popToTmp1$5$i@@0 Int) ) (! (= (select $stack@13 inline$popToTmp1$5$i@@0) (select $stack@13 inline$popToTmp1$5$i@@0))
 :qid |unknown.0:0|
 :skolemid |6|
)) (and (=> (= (ControlFlow 0 180) (- 0 182)) (= $tmp1@6 (select $stack@13 (- $sp@25 1)))) (=> (= $tmp1@6 (select $stack@13 (- $sp@25 1))) (and (=> (= (ControlFlow 0 180) (- 0 181)) (<= 0 $sp@26)) (=> (<= 0 $sp@26) (=> (= (ControlFlow 0 180) 178) inline$popToTmp2$3$Entry_correct)))))))))))
(let ((inline$popToTmp1$5$anon0_correct  (=> (= $sp@26 (- $sp@25 1)) (=> (and (= $tmp1@6 (select $stack@13 $sp@26)) (= (ControlFlow 0 185) 180)) inline$popToTmp1$5$Return_correct))))
(let ((inline$popToTmp1$5$Entry_correct  (and (=> (= (ControlFlow 0 186) (- 0 187)) (> $sp@25 0)) (=> (> $sp@25 0) (=> (= (ControlFlow 0 186) 185) inline$popToTmp1$5$anon0_correct)))))
(let ((inline$push$12$Return_correct  (and (=> (= (ControlFlow 0 188) (- 0 192)) (= $sp@25 (+ $sp@24 1))) (=> (= $sp@25 (+ $sp@24 1)) (and (=> (= (ControlFlow 0 188) (- 0 191)) (= (select $stack@13 $sp@24) 1.0)) (=> (= (select $stack@13 $sp@24) 1.0) (and (=> (= (ControlFlow 0 188) (- 0 190)) (forall ((inline$push$12$i Int) ) (!  (=> (not (= inline$push$12$i $sp@24)) (= (select $stack@13 inline$push$12$i) (select $stack@12 inline$push$12$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$12$i@@0 Int) ) (!  (=> (not (= inline$push$12$i@@0 $sp@24)) (= (select $stack@13 inline$push$12$i@@0) (select $stack@12 inline$push$12$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 188) (- 0 189)) (<= 0 $sp@25)) (=> (<= 0 $sp@25) (=> (= (ControlFlow 0 188) 186) inline$popToTmp1$5$Entry_correct)))))))))))
(let ((inline$push$12$anon0_correct  (=> (= $stack@13 (store $stack@12 $sp@24 1.0)) (=> (and (= $sp@25 (+ $sp@24 1)) (= (ControlFlow 0 193) 188)) inline$push$12$Return_correct))))
(let ((inline$push$12$Entry_correct  (and (=> (= (ControlFlow 0 194) (- 0 195)) (<= 0 $sp@24)) (=> (<= 0 $sp@24) (=> (= (ControlFlow 0 194) 193) inline$push$12$anon0_correct)))))
(let ((inline$push$11$Return_correct  (and (=> (= (ControlFlow 0 196) (- 0 200)) (= $sp@24 (+ $sp@23 1))) (=> (= $sp@24 (+ $sp@23 1)) (and (=> (= (ControlFlow 0 196) (- 0 199)) (= (select $stack@12 $sp@23) inline$popArgs1$2$a1@2)) (=> (= (select $stack@12 $sp@23) inline$popArgs1$2$a1@2) (and (=> (= (ControlFlow 0 196) (- 0 198)) (forall ((inline$push$11$i Int) ) (!  (=> (not (= inline$push$11$i $sp@23)) (= (select $stack@12 inline$push$11$i) (select $stack@11 inline$push$11$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$11$i@@0 Int) ) (!  (=> (not (= inline$push$11$i@@0 $sp@23)) (= (select $stack@12 inline$push$11$i@@0) (select $stack@11 inline$push$11$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 196) (- 0 197)) (<= 0 $sp@24)) (=> (<= 0 $sp@24) (=> (= (ControlFlow 0 196) 194) inline$push$12$Entry_correct)))))))))))
(let ((inline$push$11$anon0_correct  (=> (= $stack@12 (store $stack@11 $sp@23 inline$popArgs1$2$a1@2)) (=> (and (= $sp@24 (+ $sp@23 1)) (= (ControlFlow 0 201) 196)) inline$push$11$Return_correct))))
(let ((inline$push$11$Entry_correct  (and (=> (= (ControlFlow 0 202) (- 0 203)) (<= 0 $sp@23)) (=> (<= 0 $sp@23) (=> (= (ControlFlow 0 202) 201) inline$push$11$anon0_correct)))))
(let ((inline$acquire_request$0$anon4_Else_correct  (=> (and (not (real_to_bool $tmp1@5)) (= (ControlFlow 0 204) 202)) inline$push$11$Entry_correct)))
(let ((inline$popToTmp1$4$Return_correct  (and (=> (= (ControlFlow 0 223) (- 0 227)) (= $sp@23 (- $sp@22 1))) (=> (= $sp@23 (- $sp@22 1)) (and (=> (= (ControlFlow 0 223) (- 0 226)) (forall ((inline$popToTmp1$4$i Int) ) (! (= (select $stack@11 inline$popToTmp1$4$i) (select $stack@11 inline$popToTmp1$4$i))
 :qid |unknown.0:0|
 :skolemid |6|
))) (=> (forall ((inline$popToTmp1$4$i@@0 Int) ) (! (= (select $stack@11 inline$popToTmp1$4$i@@0) (select $stack@11 inline$popToTmp1$4$i@@0))
 :qid |unknown.0:0|
 :skolemid |6|
)) (and (=> (= (ControlFlow 0 223) (- 0 225)) (= $tmp1@5 (select $stack@11 (- $sp@22 1)))) (=> (= $tmp1@5 (select $stack@11 (- $sp@22 1))) (and (=> (= (ControlFlow 0 223) (- 0 224)) (<= 0 $sp@23)) (=> (<= 0 $sp@23) (and (=> (= (ControlFlow 0 223) 222) inline$acquire_request$0$anon4_Then_correct) (=> (= (ControlFlow 0 223) 204) inline$acquire_request$0$anon4_Else_correct))))))))))))
(let ((inline$popToTmp1$4$anon0_correct  (=> (= $sp@23 (- $sp@22 1)) (=> (and (= $tmp1@5 (select $stack@11 $sp@23)) (= (ControlFlow 0 228) 223)) inline$popToTmp1$4$Return_correct))))
(let ((inline$popToTmp1$4$Entry_correct  (and (=> (= (ControlFlow 0 229) (- 0 230)) (> $sp@22 0)) (=> (> $sp@22 0) (=> (= (ControlFlow 0 229) 228) inline$popToTmp1$4$anon0_correct)))))
(let ((inline$push$10$Return_correct  (and (=> (= (ControlFlow 0 231) (- 0 235)) (= $sp@22 (+ $sp@21 1))) (=> (= $sp@22 (+ $sp@21 1)) (and (=> (= (ControlFlow 0 231) (- 0 234)) (= (select $stack@11 $sp@21) inline$push$10$val@1)) (=> (= (select $stack@11 $sp@21) inline$push$10$val@1) (and (=> (= (ControlFlow 0 231) (- 0 233)) (forall ((inline$push$10$i Int) ) (!  (=> (not (= inline$push$10$i $sp@21)) (= (select $stack@11 inline$push$10$i) (select $stack@10 inline$push$10$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$10$i@@0 Int) ) (!  (=> (not (= inline$push$10$i@@0 $sp@21)) (= (select $stack@11 inline$push$10$i@@0) (select $stack@10 inline$push$10$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 231) (- 0 232)) (<= 0 $sp@22)) (=> (<= 0 $sp@22) (=> (= (ControlFlow 0 231) 229) inline$popToTmp1$4$Entry_correct)))))))))))
(let ((inline$push$10$anon0_correct  (=> (= $stack@11 (store $stack@10 $sp@21 inline$push$10$val@1)) (=> (and (= $sp@22 (+ $sp@21 1)) (= (ControlFlow 0 236) 231)) inline$push$10$Return_correct))))
(let ((inline$push$10$Entry_correct  (=> (= inline$push$10$val@1 (bool_to_real (>= $tmp2@3 $tmp1@4))) (and (=> (= (ControlFlow 0 237) (- 0 238)) (<= 0 $sp@21)) (=> (<= 0 $sp@21) (=> (= (ControlFlow 0 237) 236) inline$push$10$anon0_correct))))))
(let ((inline$popToTmp2$2$Return_correct  (and (=> (= (ControlFlow 0 239) (- 0 243)) (= $sp@21 (- $sp@20 1))) (=> (= $sp@21 (- $sp@20 1)) (and (=> (= (ControlFlow 0 239) (- 0 242)) (forall ((inline$popToTmp2$2$i Int) ) (! (= (select $stack@10 inline$popToTmp2$2$i) (select $stack@10 inline$popToTmp2$2$i))
 :qid |unknown.0:0|
 :skolemid |7|
))) (=> (forall ((inline$popToTmp2$2$i@@0 Int) ) (! (= (select $stack@10 inline$popToTmp2$2$i@@0) (select $stack@10 inline$popToTmp2$2$i@@0))
 :qid |unknown.0:0|
 :skolemid |7|
)) (and (=> (= (ControlFlow 0 239) (- 0 241)) (= $tmp2@3 (select $stack@10 (- $sp@20 1)))) (=> (= $tmp2@3 (select $stack@10 (- $sp@20 1))) (and (=> (= (ControlFlow 0 239) (- 0 240)) (<= 0 $sp@21)) (=> (<= 0 $sp@21) (=> (= (ControlFlow 0 239) 237) inline$push$10$Entry_correct)))))))))))
(let ((inline$popToTmp2$2$anon0_correct  (=> (= $sp@21 (- $sp@20 1)) (=> (and (= $tmp2@3 (select $stack@10 $sp@21)) (= (ControlFlow 0 244) 239)) inline$popToTmp2$2$Return_correct))))
(let ((inline$popToTmp2$2$Entry_correct  (and (=> (= (ControlFlow 0 245) (- 0 246)) (> $sp@20 0)) (=> (> $sp@20 0) (=> (= (ControlFlow 0 245) 244) inline$popToTmp2$2$anon0_correct)))))
(let ((inline$popToTmp1$3$Return_correct  (and (=> (= (ControlFlow 0 247) (- 0 251)) (= $sp@20 (- $sp@19 1))) (=> (= $sp@20 (- $sp@19 1)) (and (=> (= (ControlFlow 0 247) (- 0 250)) (forall ((inline$popToTmp1$3$i Int) ) (! (= (select $stack@10 inline$popToTmp1$3$i) (select $stack@10 inline$popToTmp1$3$i))
 :qid |unknown.0:0|
 :skolemid |6|
))) (=> (forall ((inline$popToTmp1$3$i@@0 Int) ) (! (= (select $stack@10 inline$popToTmp1$3$i@@0) (select $stack@10 inline$popToTmp1$3$i@@0))
 :qid |unknown.0:0|
 :skolemid |6|
)) (and (=> (= (ControlFlow 0 247) (- 0 249)) (= $tmp1@4 (select $stack@10 (- $sp@19 1)))) (=> (= $tmp1@4 (select $stack@10 (- $sp@19 1))) (and (=> (= (ControlFlow 0 247) (- 0 248)) (<= 0 $sp@20)) (=> (<= 0 $sp@20) (=> (= (ControlFlow 0 247) 245) inline$popToTmp2$2$Entry_correct)))))))))))
(let ((inline$popToTmp1$3$anon0_correct  (=> (= $sp@20 (- $sp@19 1)) (=> (and (= $tmp1@4 (select $stack@10 $sp@20)) (= (ControlFlow 0 252) 247)) inline$popToTmp1$3$Return_correct))))
(let ((inline$popToTmp1$3$Entry_correct  (and (=> (= (ControlFlow 0 253) (- 0 254)) (> $sp@19 0)) (=> (> $sp@19 0) (=> (= (ControlFlow 0 253) 252) inline$popToTmp1$3$anon0_correct)))))
(let ((inline$push$9$Return_correct  (and (=> (= (ControlFlow 0 255) (- 0 259)) (= $sp@19 (+ $sp@18 1))) (=> (= $sp@19 (+ $sp@18 1)) (and (=> (= (ControlFlow 0 255) (- 0 258)) (= (select $stack@10 $sp@18) MAX_REQUESTS)) (=> (= (select $stack@10 $sp@18) MAX_REQUESTS) (and (=> (= (ControlFlow 0 255) (- 0 257)) (forall ((inline$push$9$i Int) ) (!  (=> (not (= inline$push$9$i $sp@18)) (= (select $stack@10 inline$push$9$i) (select $stack@9 inline$push$9$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$9$i@@0 Int) ) (!  (=> (not (= inline$push$9$i@@0 $sp@18)) (= (select $stack@10 inline$push$9$i@@0) (select $stack@9 inline$push$9$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 255) (- 0 256)) (<= 0 $sp@19)) (=> (<= 0 $sp@19) (=> (= (ControlFlow 0 255) 253) inline$popToTmp1$3$Entry_correct)))))))))))
(let ((inline$push$9$anon0_correct  (=> (= $stack@10 (store $stack@9 $sp@18 MAX_REQUESTS)) (=> (and (= $sp@19 (+ $sp@18 1)) (= (ControlFlow 0 260) 255)) inline$push$9$Return_correct))))
(let ((inline$push$9$Entry_correct  (and (=> (= (ControlFlow 0 261) (- 0 262)) (<= 0 $sp@18)) (=> (<= 0 $sp@18) (=> (= (ControlFlow 0 261) 260) inline$push$9$anon0_correct)))))
(let ((inline$push$8$Return_correct  (and (=> (= (ControlFlow 0 263) (- 0 267)) (= $sp@18 (+ $sp@17 1))) (=> (= $sp@18 (+ $sp@17 1)) (and (=> (= (ControlFlow 0 263) (- 0 266)) (= (select $stack@9 $sp@17) inline$popArgs1$2$a1@2)) (=> (= (select $stack@9 $sp@17) inline$popArgs1$2$a1@2) (and (=> (= (ControlFlow 0 263) (- 0 265)) (forall ((inline$push$8$i Int) ) (!  (=> (not (= inline$push$8$i $sp@17)) (= (select $stack@9 inline$push$8$i) (select $stack@8 inline$push$8$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$8$i@@0 Int) ) (!  (=> (not (= inline$push$8$i@@0 $sp@17)) (= (select $stack@9 inline$push$8$i@@0) (select $stack@8 inline$push$8$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 263) (- 0 264)) (<= 0 $sp@18)) (=> (<= 0 $sp@18) (=> (= (ControlFlow 0 263) 261) inline$push$9$Entry_correct)))))))))))
(let ((inline$push$8$anon0_correct  (=> (= $stack@9 (store $stack@8 $sp@17 inline$popArgs1$2$a1@2)) (=> (and (= $sp@18 (+ $sp@17 1)) (= (ControlFlow 0 268) 263)) inline$push$8$Return_correct))))
(let ((inline$push$8$Entry_correct  (and (=> (= (ControlFlow 0 269) (- 0 270)) (<= 0 $sp@17)) (=> (<= 0 $sp@17) (=> (= (ControlFlow 0 269) 268) inline$push$8$anon0_correct)))))
(let ((inline$popArgs1$2$Return_correct  (and (=> (= (ControlFlow 0 271) (- 0 275)) (= $sp@17 (- $sp@16 1))) (=> (= $sp@17 (- $sp@16 1)) (and (=> (= (ControlFlow 0 271) (- 0 274)) (<= 0 $sp@17)) (=> (<= 0 $sp@17) (and (=> (= (ControlFlow 0 271) (- 0 273)) (forall ((inline$popArgs1$2$i Int) ) (! (= (select $stack@8 inline$popArgs1$2$i) (select $stack@8 inline$popArgs1$2$i))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (forall ((inline$popArgs1$2$i@@0 Int) ) (! (= (select $stack@8 inline$popArgs1$2$i@@0) (select $stack@8 inline$popArgs1$2$i@@0))
 :qid |unknown.0:0|
 :skolemid |9|
)) (and (=> (= (ControlFlow 0 271) (- 0 272)) (= inline$popArgs1$2$a1@2 (select $stack@8 (- $sp@16 1)))) (=> (= inline$popArgs1$2$a1@2 (select $stack@8 (- $sp@16 1))) (=> (= (ControlFlow 0 271) 269) inline$push$8$Entry_correct)))))))))))
(let ((inline$popArgs1$2$anon0_correct  (=> (= $sp@17 (- $sp@16 1)) (=> (and (= inline$popArgs1$2$a1@2 (select $stack@8 $sp@17)) (= (ControlFlow 0 276) 271)) inline$popArgs1$2$Return_correct))))
(let ((inline$popArgs1$2$Entry_correct  (and (=> (= (ControlFlow 0 277) (- 0 278)) (>= $sp@16 1)) (=> (>= $sp@16 1) (=> (= (ControlFlow 0 277) 276) inline$popArgs1$2$anon0_correct)))))
(let ((inline$push$7$Return_correct  (and (=> (= (ControlFlow 0 279) (- 0 283)) (= $sp@16 (+ $sp@0 1))) (=> (= $sp@16 (+ $sp@0 1)) (and (=> (= (ControlFlow 0 279) (- 0 282)) (= (select $stack@8 $sp@0) active_requests@0)) (=> (= (select $stack@8 $sp@0) active_requests@0) (and (=> (= (ControlFlow 0 279) (- 0 281)) (forall ((inline$push$7$i Int) ) (!  (=> (not (= inline$push$7$i $sp@0)) (= (select $stack@8 inline$push$7$i) (select $stack@0 inline$push$7$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$7$i@@0 Int) ) (!  (=> (not (= inline$push$7$i@@0 $sp@0)) (= (select $stack@8 inline$push$7$i@@0) (select $stack@0 inline$push$7$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 279) (- 0 280)) (<= 0 $sp@16)) (=> (<= 0 $sp@16) (=> (= (ControlFlow 0 279) 277) inline$popArgs1$2$Entry_correct)))))))))))
(let ((inline$push$7$anon0_correct  (=> (= $stack@8 (store $stack@0 $sp@0 active_requests@0)) (=> (and (= $sp@16 (+ $sp@0 1)) (= (ControlFlow 0 284) 279)) inline$push$7$Return_correct))))
(let ((inline$push$7$Entry_correct  (and (=> (= (ControlFlow 0 285) (- 0 286)) (<= 0 $sp@0)) (=> (<= 0 $sp@0) (=> (= (ControlFlow 0 285) 284) inline$push$7$anon0_correct)))))
(let ((anon5_Then_correct  (=> (and (= c@1 0) (= (ControlFlow 0 287) 285)) inline$push$7$Entry_correct)))
(let ((anon6_Then$1_correct  (=> (= (ControlFlow 0 5) (- 0 4)) (<= 0 $sp@15))))
(let ((inline$release_request$0$anon2_Then$6_correct  (=> (and (= $sp@15 $sp@14) (= (ControlFlow 0 7) 5)) anon6_Then$1_correct)))
(let ((inline$popArgs1$1$Return_correct  (and (=> (= (ControlFlow 0 8) (- 0 12)) (= $sp@14 (- $sp@13 1))) (=> (= $sp@14 (- $sp@13 1)) (and (=> (= (ControlFlow 0 8) (- 0 11)) (<= 0 $sp@14)) (=> (<= 0 $sp@14) (and (=> (= (ControlFlow 0 8) (- 0 10)) (forall ((inline$popArgs1$1$i Int) ) (! (= (select $stack@7 inline$popArgs1$1$i) (select $stack@7 inline$popArgs1$1$i))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (forall ((inline$popArgs1$1$i@@0 Int) ) (! (= (select $stack@7 inline$popArgs1$1$i@@0) (select $stack@7 inline$popArgs1$1$i@@0))
 :qid |unknown.0:0|
 :skolemid |9|
)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (= inline$popArgs1$1$a1@2 (select $stack@7 (- $sp@13 1)))) (=> (= inline$popArgs1$1$a1@2 (select $stack@7 (- $sp@13 1))) (=> (= (ControlFlow 0 8) 7) inline$release_request$0$anon2_Then$6_correct)))))))))))
(let ((inline$popArgs1$1$anon0_correct  (=> (= $sp@14 (- $sp@13 1)) (=> (and (= inline$popArgs1$1$a1@2 (select $stack@7 $sp@14)) (= (ControlFlow 0 13) 8)) inline$popArgs1$1$Return_correct))))
(let ((inline$popArgs1$1$Entry_correct  (and (=> (= (ControlFlow 0 14) (- 0 15)) (>= $sp@13 1)) (=> (>= $sp@13 1) (=> (= (ControlFlow 0 14) 13) inline$popArgs1$1$anon0_correct)))))
(let ((inline$push$6$Return_correct  (and (=> (= (ControlFlow 0 16) (- 0 20)) (= $sp@13 (+ $sp@12 1))) (=> (= $sp@13 (+ $sp@12 1)) (and (=> (= (ControlFlow 0 16) (- 0 19)) (= (select $stack@7 $sp@12) inline$push$6$val@1)) (=> (= (select $stack@7 $sp@12) inline$push$6$val@1) (and (=> (= (ControlFlow 0 16) (- 0 18)) (forall ((inline$push$6$i Int) ) (!  (=> (not (= inline$push$6$i $sp@12)) (= (select $stack@7 inline$push$6$i) (select $stack@6 inline$push$6$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$6$i@@0 Int) ) (!  (=> (not (= inline$push$6$i@@0 $sp@12)) (= (select $stack@7 inline$push$6$i@@0) (select $stack@6 inline$push$6$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= 0 $sp@13)) (=> (<= 0 $sp@13) (=> (= (ControlFlow 0 16) 14) inline$popArgs1$1$Entry_correct)))))))))))
(let ((inline$push$6$anon0_correct  (=> (= $stack@7 (store $stack@6 $sp@12 inline$push$6$val@1)) (=> (and (= $sp@13 (+ $sp@12 1)) (= (ControlFlow 0 21) 16)) inline$push$6$Return_correct))))
(let ((inline$push$6$Entry_correct  (=> (= inline$push$6$val@1 (- $tmp2@2 $tmp1@3)) (and (=> (= (ControlFlow 0 22) (- 0 23)) (<= 0 $sp@12)) (=> (<= 0 $sp@12) (=> (= (ControlFlow 0 22) 21) inline$push$6$anon0_correct))))))
(let ((inline$popToTmp2$1$Return_correct  (and (=> (= (ControlFlow 0 24) (- 0 28)) (= $sp@12 (- $sp@11 1))) (=> (= $sp@12 (- $sp@11 1)) (and (=> (= (ControlFlow 0 24) (- 0 27)) (forall ((inline$popToTmp2$1$i Int) ) (! (= (select $stack@6 inline$popToTmp2$1$i) (select $stack@6 inline$popToTmp2$1$i))
 :qid |unknown.0:0|
 :skolemid |7|
))) (=> (forall ((inline$popToTmp2$1$i@@0 Int) ) (! (= (select $stack@6 inline$popToTmp2$1$i@@0) (select $stack@6 inline$popToTmp2$1$i@@0))
 :qid |unknown.0:0|
 :skolemid |7|
)) (and (=> (= (ControlFlow 0 24) (- 0 26)) (= $tmp2@2 (select $stack@6 (- $sp@11 1)))) (=> (= $tmp2@2 (select $stack@6 (- $sp@11 1))) (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= 0 $sp@12)) (=> (<= 0 $sp@12) (=> (= (ControlFlow 0 24) 22) inline$push$6$Entry_correct)))))))))))
(let ((inline$popToTmp2$1$anon0_correct  (=> (= $sp@12 (- $sp@11 1)) (=> (and (= $tmp2@2 (select $stack@6 $sp@12)) (= (ControlFlow 0 29) 24)) inline$popToTmp2$1$Return_correct))))
(let ((inline$popToTmp2$1$Entry_correct  (and (=> (= (ControlFlow 0 30) (- 0 31)) (> $sp@11 0)) (=> (> $sp@11 0) (=> (= (ControlFlow 0 30) 29) inline$popToTmp2$1$anon0_correct)))))
(let ((inline$popToTmp1$2$Return_correct  (and (=> (= (ControlFlow 0 32) (- 0 36)) (= $sp@11 (- $sp@10 1))) (=> (= $sp@11 (- $sp@10 1)) (and (=> (= (ControlFlow 0 32) (- 0 35)) (forall ((inline$popToTmp1$2$i Int) ) (! (= (select $stack@6 inline$popToTmp1$2$i) (select $stack@6 inline$popToTmp1$2$i))
 :qid |unknown.0:0|
 :skolemid |6|
))) (=> (forall ((inline$popToTmp1$2$i@@0 Int) ) (! (= (select $stack@6 inline$popToTmp1$2$i@@0) (select $stack@6 inline$popToTmp1$2$i@@0))
 :qid |unknown.0:0|
 :skolemid |6|
)) (and (=> (= (ControlFlow 0 32) (- 0 34)) (= $tmp1@3 (select $stack@6 (- $sp@10 1)))) (=> (= $tmp1@3 (select $stack@6 (- $sp@10 1))) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= 0 $sp@11)) (=> (<= 0 $sp@11) (=> (= (ControlFlow 0 32) 30) inline$popToTmp2$1$Entry_correct)))))))))))
(let ((inline$popToTmp1$2$anon0_correct  (=> (= $sp@11 (- $sp@10 1)) (=> (and (= $tmp1@3 (select $stack@6 $sp@11)) (= (ControlFlow 0 37) 32)) inline$popToTmp1$2$Return_correct))))
(let ((inline$popToTmp1$2$Entry_correct  (and (=> (= (ControlFlow 0 38) (- 0 39)) (> $sp@10 0)) (=> (> $sp@10 0) (=> (= (ControlFlow 0 38) 37) inline$popToTmp1$2$anon0_correct)))))
(let ((inline$push$5$Return_correct  (and (=> (= (ControlFlow 0 40) (- 0 44)) (= $sp@10 (+ $sp@9 1))) (=> (= $sp@10 (+ $sp@9 1)) (and (=> (= (ControlFlow 0 40) (- 0 43)) (= (select $stack@6 $sp@9) 1.0)) (=> (= (select $stack@6 $sp@9) 1.0) (and (=> (= (ControlFlow 0 40) (- 0 42)) (forall ((inline$push$5$i Int) ) (!  (=> (not (= inline$push$5$i $sp@9)) (= (select $stack@6 inline$push$5$i) (select $stack@5 inline$push$5$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$5$i@@0 Int) ) (!  (=> (not (= inline$push$5$i@@0 $sp@9)) (= (select $stack@6 inline$push$5$i@@0) (select $stack@5 inline$push$5$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (<= 0 $sp@10)) (=> (<= 0 $sp@10) (=> (= (ControlFlow 0 40) 38) inline$popToTmp1$2$Entry_correct)))))))))))
(let ((inline$push$5$anon0_correct  (=> (= $stack@6 (store $stack@5 $sp@9 1.0)) (=> (and (= $sp@10 (+ $sp@9 1)) (= (ControlFlow 0 45) 40)) inline$push$5$Return_correct))))
(let ((inline$push$5$Entry_correct  (and (=> (= (ControlFlow 0 46) (- 0 47)) (<= 0 $sp@9)) (=> (<= 0 $sp@9) (=> (= (ControlFlow 0 46) 45) inline$push$5$anon0_correct)))))
(let ((inline$push$4$Return_correct  (and (=> (= (ControlFlow 0 48) (- 0 52)) (= $sp@9 (+ $sp@8 1))) (=> (= $sp@9 (+ $sp@8 1)) (and (=> (= (ControlFlow 0 48) (- 0 51)) (= (select $stack@5 $sp@8) inline$popArgs1$0$a1@2)) (=> (= (select $stack@5 $sp@8) inline$popArgs1$0$a1@2) (and (=> (= (ControlFlow 0 48) (- 0 50)) (forall ((inline$push$4$i Int) ) (!  (=> (not (= inline$push$4$i $sp@8)) (= (select $stack@5 inline$push$4$i) (select $stack@4 inline$push$4$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$4$i@@0 Int) ) (!  (=> (not (= inline$push$4$i@@0 $sp@8)) (= (select $stack@5 inline$push$4$i@@0) (select $stack@4 inline$push$4$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 48) (- 0 49)) (<= 0 $sp@9)) (=> (<= 0 $sp@9) (=> (= (ControlFlow 0 48) 46) inline$push$5$Entry_correct)))))))))))
(let ((inline$push$4$anon0_correct  (=> (= $stack@5 (store $stack@4 $sp@8 inline$popArgs1$0$a1@2)) (=> (and (= $sp@9 (+ $sp@8 1)) (= (ControlFlow 0 53) 48)) inline$push$4$Return_correct))))
(let ((inline$push$4$Entry_correct  (and (=> (= (ControlFlow 0 54) (- 0 55)) (<= 0 $sp@8)) (=> (<= 0 $sp@8) (=> (= (ControlFlow 0 54) 53) inline$push$4$anon0_correct)))))
(let ((inline$release_request$0$anon2_Then_correct  (=> (and (real_to_bool $tmp1@2) (= (ControlFlow 0 56) 54)) inline$push$4$Entry_correct)))
(let ((inline$release_request$0$anon2_Else_correct  (=> (not (real_to_bool $tmp1@2)) (=> (and (= $sp@15 $sp@8) (= (ControlFlow 0 6) 5)) anon6_Then$1_correct))))
(let ((inline$popToTmp1$1$Return_correct  (and (=> (= (ControlFlow 0 57) (- 0 61)) (= $sp@8 (- $sp@7 1))) (=> (= $sp@8 (- $sp@7 1)) (and (=> (= (ControlFlow 0 57) (- 0 60)) (forall ((inline$popToTmp1$1$i Int) ) (! (= (select $stack@4 inline$popToTmp1$1$i) (select $stack@4 inline$popToTmp1$1$i))
 :qid |unknown.0:0|
 :skolemid |6|
))) (=> (forall ((inline$popToTmp1$1$i@@0 Int) ) (! (= (select $stack@4 inline$popToTmp1$1$i@@0) (select $stack@4 inline$popToTmp1$1$i@@0))
 :qid |unknown.0:0|
 :skolemid |6|
)) (and (=> (= (ControlFlow 0 57) (- 0 59)) (= $tmp1@2 (select $stack@4 (- $sp@7 1)))) (=> (= $tmp1@2 (select $stack@4 (- $sp@7 1))) (and (=> (= (ControlFlow 0 57) (- 0 58)) (<= 0 $sp@8)) (=> (<= 0 $sp@8) (and (=> (= (ControlFlow 0 57) 56) inline$release_request$0$anon2_Then_correct) (=> (= (ControlFlow 0 57) 6) inline$release_request$0$anon2_Else_correct))))))))))))
(let ((inline$popToTmp1$1$anon0_correct  (=> (= $sp@8 (- $sp@7 1)) (=> (and (= $tmp1@2 (select $stack@4 $sp@8)) (= (ControlFlow 0 62) 57)) inline$popToTmp1$1$Return_correct))))
(let ((inline$popToTmp1$1$Entry_correct  (and (=> (= (ControlFlow 0 63) (- 0 64)) (> $sp@7 0)) (=> (> $sp@7 0) (=> (= (ControlFlow 0 63) 62) inline$popToTmp1$1$anon0_correct)))))
(let ((inline$push$3$Return_correct  (and (=> (= (ControlFlow 0 65) (- 0 69)) (= $sp@7 (+ $sp@6 1))) (=> (= $sp@7 (+ $sp@6 1)) (and (=> (= (ControlFlow 0 65) (- 0 68)) (= (select $stack@4 $sp@6) inline$push$3$val@1)) (=> (= (select $stack@4 $sp@6) inline$push$3$val@1) (and (=> (= (ControlFlow 0 65) (- 0 67)) (forall ((inline$push$3$i Int) ) (!  (=> (not (= inline$push$3$i $sp@6)) (= (select $stack@4 inline$push$3$i) (select $stack@3 inline$push$3$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$3$i@@0 Int) ) (!  (=> (not (= inline$push$3$i@@0 $sp@6)) (= (select $stack@4 inline$push$3$i@@0) (select $stack@3 inline$push$3$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 65) (- 0 66)) (<= 0 $sp@7)) (=> (<= 0 $sp@7) (=> (= (ControlFlow 0 65) 63) inline$popToTmp1$1$Entry_correct)))))))))))
(let ((inline$push$3$anon0_correct  (=> (= $stack@4 (store $stack@3 $sp@6 inline$push$3$val@1)) (=> (and (= $sp@7 (+ $sp@6 1)) (= (ControlFlow 0 70) 65)) inline$push$3$Return_correct))))
(let ((inline$push$3$Entry_correct  (=> (= inline$push$3$val@1 (bool_to_real (> $tmp2@1 $tmp1@1))) (and (=> (= (ControlFlow 0 71) (- 0 72)) (<= 0 $sp@6)) (=> (<= 0 $sp@6) (=> (= (ControlFlow 0 71) 70) inline$push$3$anon0_correct))))))
(let ((inline$popToTmp2$0$Return_correct  (and (=> (= (ControlFlow 0 73) (- 0 77)) (= $sp@6 (- $sp@5 1))) (=> (= $sp@6 (- $sp@5 1)) (and (=> (= (ControlFlow 0 73) (- 0 76)) (forall ((inline$popToTmp2$0$i Int) ) (! (= (select $stack@3 inline$popToTmp2$0$i) (select $stack@3 inline$popToTmp2$0$i))
 :qid |unknown.0:0|
 :skolemid |7|
))) (=> (forall ((inline$popToTmp2$0$i@@0 Int) ) (! (= (select $stack@3 inline$popToTmp2$0$i@@0) (select $stack@3 inline$popToTmp2$0$i@@0))
 :qid |unknown.0:0|
 :skolemid |7|
)) (and (=> (= (ControlFlow 0 73) (- 0 75)) (= $tmp2@1 (select $stack@3 (- $sp@5 1)))) (=> (= $tmp2@1 (select $stack@3 (- $sp@5 1))) (and (=> (= (ControlFlow 0 73) (- 0 74)) (<= 0 $sp@6)) (=> (<= 0 $sp@6) (=> (= (ControlFlow 0 73) 71) inline$push$3$Entry_correct)))))))))))
(let ((inline$popToTmp2$0$anon0_correct  (=> (= $sp@6 (- $sp@5 1)) (=> (and (= $tmp2@1 (select $stack@3 $sp@6)) (= (ControlFlow 0 78) 73)) inline$popToTmp2$0$Return_correct))))
(let ((inline$popToTmp2$0$Entry_correct  (and (=> (= (ControlFlow 0 79) (- 0 80)) (> $sp@5 0)) (=> (> $sp@5 0) (=> (= (ControlFlow 0 79) 78) inline$popToTmp2$0$anon0_correct)))))
(let ((inline$popToTmp1$0$Return_correct  (and (=> (= (ControlFlow 0 81) (- 0 85)) (= $sp@5 (- $sp@4 1))) (=> (= $sp@5 (- $sp@4 1)) (and (=> (= (ControlFlow 0 81) (- 0 84)) (forall ((inline$popToTmp1$0$i Int) ) (! (= (select $stack@3 inline$popToTmp1$0$i) (select $stack@3 inline$popToTmp1$0$i))
 :qid |unknown.0:0|
 :skolemid |6|
))) (=> (forall ((inline$popToTmp1$0$i@@0 Int) ) (! (= (select $stack@3 inline$popToTmp1$0$i@@0) (select $stack@3 inline$popToTmp1$0$i@@0))
 :qid |unknown.0:0|
 :skolemid |6|
)) (and (=> (= (ControlFlow 0 81) (- 0 83)) (= $tmp1@1 (select $stack@3 (- $sp@4 1)))) (=> (= $tmp1@1 (select $stack@3 (- $sp@4 1))) (and (=> (= (ControlFlow 0 81) (- 0 82)) (<= 0 $sp@5)) (=> (<= 0 $sp@5) (=> (= (ControlFlow 0 81) 79) inline$popToTmp2$0$Entry_correct)))))))))))
(let ((inline$popToTmp1$0$anon0_correct  (=> (= $sp@5 (- $sp@4 1)) (=> (and (= $tmp1@1 (select $stack@3 $sp@5)) (= (ControlFlow 0 86) 81)) inline$popToTmp1$0$Return_correct))))
(let ((inline$popToTmp1$0$Entry_correct  (and (=> (= (ControlFlow 0 87) (- 0 88)) (> $sp@4 0)) (=> (> $sp@4 0) (=> (= (ControlFlow 0 87) 86) inline$popToTmp1$0$anon0_correct)))))
(let ((inline$push$2$Return_correct  (and (=> (= (ControlFlow 0 89) (- 0 93)) (= $sp@4 (+ $sp@3 1))) (=> (= $sp@4 (+ $sp@3 1)) (and (=> (= (ControlFlow 0 89) (- 0 92)) (= (select $stack@3 $sp@3) 0.0)) (=> (= (select $stack@3 $sp@3) 0.0) (and (=> (= (ControlFlow 0 89) (- 0 91)) (forall ((inline$push$2$i Int) ) (!  (=> (not (= inline$push$2$i $sp@3)) (= (select $stack@3 inline$push$2$i) (select $stack@2 inline$push$2$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$2$i@@0 Int) ) (!  (=> (not (= inline$push$2$i@@0 $sp@3)) (= (select $stack@3 inline$push$2$i@@0) (select $stack@2 inline$push$2$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 89) (- 0 90)) (<= 0 $sp@4)) (=> (<= 0 $sp@4) (=> (= (ControlFlow 0 89) 87) inline$popToTmp1$0$Entry_correct)))))))))))
(let ((inline$push$2$anon0_correct  (=> (= $stack@3 (store $stack@2 $sp@3 0.0)) (=> (and (= $sp@4 (+ $sp@3 1)) (= (ControlFlow 0 94) 89)) inline$push$2$Return_correct))))
(let ((inline$push$2$Entry_correct  (and (=> (= (ControlFlow 0 95) (- 0 96)) (<= 0 $sp@3)) (=> (<= 0 $sp@3) (=> (= (ControlFlow 0 95) 94) inline$push$2$anon0_correct)))))
(let ((inline$push$1$Return_correct  (and (=> (= (ControlFlow 0 97) (- 0 101)) (= $sp@3 (+ $sp@2 1))) (=> (= $sp@3 (+ $sp@2 1)) (and (=> (= (ControlFlow 0 97) (- 0 100)) (= (select $stack@2 $sp@2) inline$popArgs1$0$a1@2)) (=> (= (select $stack@2 $sp@2) inline$popArgs1$0$a1@2) (and (=> (= (ControlFlow 0 97) (- 0 99)) (forall ((inline$push$1$i Int) ) (!  (=> (not (= inline$push$1$i $sp@2)) (= (select $stack@2 inline$push$1$i) (select $stack@1 inline$push$1$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$1$i@@0 Int) ) (!  (=> (not (= inline$push$1$i@@0 $sp@2)) (= (select $stack@2 inline$push$1$i@@0) (select $stack@1 inline$push$1$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 97) (- 0 98)) (<= 0 $sp@3)) (=> (<= 0 $sp@3) (=> (= (ControlFlow 0 97) 95) inline$push$2$Entry_correct)))))))))))
(let ((inline$push$1$anon0_correct  (=> (= $stack@2 (store $stack@1 $sp@2 inline$popArgs1$0$a1@2)) (=> (and (= $sp@3 (+ $sp@2 1)) (= (ControlFlow 0 102) 97)) inline$push$1$Return_correct))))
(let ((inline$push$1$Entry_correct  (and (=> (= (ControlFlow 0 103) (- 0 104)) (<= 0 $sp@2)) (=> (<= 0 $sp@2) (=> (= (ControlFlow 0 103) 102) inline$push$1$anon0_correct)))))
(let ((inline$popArgs1$0$Return_correct  (and (=> (= (ControlFlow 0 105) (- 0 109)) (= $sp@2 (- $sp@1 1))) (=> (= $sp@2 (- $sp@1 1)) (and (=> (= (ControlFlow 0 105) (- 0 108)) (<= 0 $sp@2)) (=> (<= 0 $sp@2) (and (=> (= (ControlFlow 0 105) (- 0 107)) (forall ((inline$popArgs1$0$i Int) ) (! (= (select $stack@1 inline$popArgs1$0$i) (select $stack@1 inline$popArgs1$0$i))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (forall ((inline$popArgs1$0$i@@0 Int) ) (! (= (select $stack@1 inline$popArgs1$0$i@@0) (select $stack@1 inline$popArgs1$0$i@@0))
 :qid |unknown.0:0|
 :skolemid |9|
)) (and (=> (= (ControlFlow 0 105) (- 0 106)) (= inline$popArgs1$0$a1@2 (select $stack@1 (- $sp@1 1)))) (=> (= inline$popArgs1$0$a1@2 (select $stack@1 (- $sp@1 1))) (=> (= (ControlFlow 0 105) 103) inline$push$1$Entry_correct)))))))))))
(let ((inline$popArgs1$0$anon0_correct  (=> (= $sp@2 (- $sp@1 1)) (=> (and (= inline$popArgs1$0$a1@2 (select $stack@1 $sp@2)) (= (ControlFlow 0 110) 105)) inline$popArgs1$0$Return_correct))))
(let ((inline$popArgs1$0$Entry_correct  (and (=> (= (ControlFlow 0 111) (- 0 112)) (>= $sp@1 1)) (=> (>= $sp@1 1) (=> (= (ControlFlow 0 111) 110) inline$popArgs1$0$anon0_correct)))))
(let ((inline$push$0$Return_correct  (and (=> (= (ControlFlow 0 113) (- 0 117)) (= $sp@1 (+ $sp@0 1))) (=> (= $sp@1 (+ $sp@0 1)) (and (=> (= (ControlFlow 0 113) (- 0 116)) (= (select $stack@1 $sp@0) active_requests@0)) (=> (= (select $stack@1 $sp@0) active_requests@0) (and (=> (= (ControlFlow 0 113) (- 0 115)) (forall ((inline$push$0$i Int) ) (!  (=> (not (= inline$push$0$i $sp@0)) (= (select $stack@1 inline$push$0$i) (select $stack@0 inline$push$0$i)))
 :qid |unknown.0:0|
 :skolemid |5|
))) (=> (forall ((inline$push$0$i@@0 Int) ) (!  (=> (not (= inline$push$0$i@@0 $sp@0)) (= (select $stack@1 inline$push$0$i@@0) (select $stack@0 inline$push$0$i@@0)))
 :qid |unknown.0:0|
 :skolemid |5|
)) (and (=> (= (ControlFlow 0 113) (- 0 114)) (<= 0 $sp@1)) (=> (<= 0 $sp@1) (=> (= (ControlFlow 0 113) 111) inline$popArgs1$0$Entry_correct)))))))))))
(let ((inline$push$0$anon0_correct  (=> (= $stack@1 (store $stack@0 $sp@0 active_requests@0)) (=> (and (= $sp@1 (+ $sp@0 1)) (= (ControlFlow 0 118) 113)) inline$push$0$Return_correct))))
(let ((inline$push$0$Entry_correct  (and (=> (= (ControlFlow 0 119) (- 0 120)) (<= 0 $sp@0)) (=> (<= 0 $sp@0) (=> (= (ControlFlow 0 119) 118) inline$push$0$anon0_correct)))))
(let ((anon6_Then_correct  (=> (and (= c@1 1) (= (ControlFlow 0 121) 119)) inline$push$0$Entry_correct)))
(let ((anon6_Else_correct  (=> (and (not (= c@1 1)) (= (ControlFlow 0 3) (- 0 2))) (<= 0 $sp@0))))
(let ((anon5_Else_correct  (=> (not (= c@1 0)) (and (=> (= (ControlFlow 0 122) 121) anon6_Then_correct) (=> (= (ControlFlow 0 122) 3) anon6_Else_correct)))))
(let ((anon4_LoopBody_correct  (=> (and (<= 0 c@1) (< c@1 2)) (and (=> (= (ControlFlow 0 288) 287) anon5_Then_correct) (=> (= (ControlFlow 0 288) 122) anon5_Else_correct)))))
(let ((anon4_LoopDone_correct true))
(let ((anon4_LoopHead_correct  (=> (<= 0 $sp@0) (and (=> (= (ControlFlow 0 289) 1) anon4_LoopDone_correct) (=> (= (ControlFlow 0 289) 288) anon4_LoopBody_correct)))))
(let ((anon0$2_correct  (and (=> (= (ControlFlow 0 290) (- 0 291)) (<= 0 0)) (=> (<= 0 0) (=> (= (ControlFlow 0 290) 289) anon4_LoopHead_correct)))))
(let ((inline$InitRuntime$0$Return_correct  (and (=> (= (ControlFlow 0 292) (- 0 294)) (= 0 0)) (=> (= 0 0) (and (=> (= (ControlFlow 0 292) (- 0 293)) (<= 0 0)) (=> (<= 0 0) (=> (= (ControlFlow 0 292) 290) anon0$2_correct)))))))
(let ((inline$initGlobals$0$Return_correct  (and (=> (= (ControlFlow 0 295) (- 0 296)) (= 0.0 0.0)) (=> (= 0.0 0.0) (=> (= (ControlFlow 0 295) 292) inline$InitRuntime$0$Return_correct)))))
(let ((anon0_correct  (=> (= (ControlFlow 0 297) 295) inline$initGlobals$0$Return_correct)))
anon0_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :rlimit)
(pop 1)
; Valid
