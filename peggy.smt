(set-option :print-success false)
(set-info :smt-lib-version 2.6)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun floor_real (Real) Real)
(declare-fun sqrt_real (Real) Real)
(declare-fun to_u8 (Int) Int)
(declare-fun byte0_16 (Int) Int)
(declare-fun byte1_16 (Int) Int)
(declare-fun byte0_32 (Int) Int)
(declare-fun byte1_32 (Int) Int)
(declare-fun byte2_32 (Int) Int)
(declare-fun byte3_32 (Int) Int)
(declare-fun byte0_64 (Int) Int)
(declare-fun byte1_64 (Int) Int)
(declare-fun byte2_64 (Int) Int)
(declare-fun byte3_64 (Int) Int)
(declare-fun byte4_64 (Int) Int)
(declare-fun byte5_64 (Int) Int)
(declare-fun byte6_64 (Int) Int)
(declare-fun byte7_64 (Int) Int)
(declare-fun real_to_bool (Real) Bool)
(declare-fun min_real (Real Real) Real)
(declare-fun max_real (Real Real) Real)
(declare-fun abs_real (Real) Real)
(declare-fun bool_to_real (Bool) Real)
(declare-fun nearest_real (Real) Real)
(declare-fun global_2 () Real)
(declare-fun global_4 () Real)
(declare-fun global_5 () Real)
(declare-fun global_6 () Real)
(declare-fun global_1 () Real)
(declare-fun global_3 () Real)
(assert (forall ((r Real) ) (! (< r (+ (floor_real r) 1.0))
 :qid |peggybpl.264:15|
 :skolemid |28|
)))
(assert (forall ((r@@0 Real) ) (!  (=> (>= r@@0 0.0) (>= (sqrt_real r@@0) 0.0))
 :qid |peggybpl.252:15|
 :skolemid |23|
 :pattern ( (sqrt_real r@@0))
)))
(assert (forall ((x Int) ) (!  (and (<= 0 (to_u8 x)) (< (to_u8 x) 256))
 :qid |peggybpl.10:15|
 :skolemid |0|
)))
(assert (forall ((x@@0 Int) ) (!  (and (<= 0 (byte0_16 x@@0)) (< (byte0_16 x@@0) 256))
 :qid |peggybpl.112:15|
 :skolemid |1|
)))
(assert (forall ((x@@1 Int) ) (!  (and (<= 0 (byte1_16 x@@1)) (< (byte1_16 x@@1) 256))
 :qid |peggybpl.115:15|
 :skolemid |2|
)))
(assert (forall ((x@@2 Int) ) (!  (and (<= 0 (byte0_32 x@@2)) (< (byte0_32 x@@2) 256))
 :qid |peggybpl.118:15|
 :skolemid |3|
)))
(assert (forall ((x@@3 Int) ) (!  (and (<= 0 (byte1_32 x@@3)) (< (byte1_32 x@@3) 256))
 :qid |peggybpl.121:15|
 :skolemid |4|
)))
(assert (forall ((x@@4 Int) ) (!  (and (<= 0 (byte2_32 x@@4)) (< (byte2_32 x@@4) 256))
 :qid |peggybpl.124:15|
 :skolemid |5|
)))
(assert (forall ((x@@5 Int) ) (!  (and (<= 0 (byte3_32 x@@5)) (< (byte3_32 x@@5) 256))
 :qid |peggybpl.127:15|
 :skolemid |6|
)))
(assert (forall ((x@@6 Int) ) (!  (and (<= 0 (byte0_64 x@@6)) (< (byte0_64 x@@6) 256))
 :qid |peggybpl.130:15|
 :skolemid |7|
)))
(assert (forall ((x@@7 Int) ) (!  (and (<= 0 (byte1_64 x@@7)) (< (byte1_64 x@@7) 256))
 :qid |peggybpl.133:15|
 :skolemid |8|
)))
(assert (forall ((x@@8 Int) ) (!  (and (<= 0 (byte2_64 x@@8)) (< (byte2_64 x@@8) 256))
 :qid |peggybpl.136:15|
 :skolemid |9|
)))
(assert (forall ((x@@9 Int) ) (!  (and (<= 0 (byte3_64 x@@9)) (< (byte3_64 x@@9) 256))
 :qid |peggybpl.139:15|
 :skolemid |10|
)))
(assert (forall ((x@@10 Int) ) (!  (and (<= 0 (byte4_64 x@@10)) (< (byte4_64 x@@10) 256))
 :qid |peggybpl.142:15|
 :skolemid |11|
)))
(assert (forall ((x@@11 Int) ) (!  (and (<= 0 (byte5_64 x@@11)) (< (byte5_64 x@@11) 256))
 :qid |peggybpl.145:15|
 :skolemid |12|
)))
(assert (forall ((x@@12 Int) ) (!  (and (<= 0 (byte6_64 x@@12)) (< (byte6_64 x@@12) 256))
 :qid |peggybpl.148:15|
 :skolemid |13|
)))
(assert (forall ((x@@13 Int) ) (!  (and (<= 0 (byte7_64 x@@13)) (< (byte7_64 x@@13) 256))
 :qid |peggybpl.151:15|
 :skolemid |14|
)))
(assert (forall ((r@@1 Real) ) (! (= (= (real_to_bool r@@1) false) (= r@@1 0.0))
 :qid |peggybpl.233:15|
 :skolemid |19|
 :pattern ( (real_to_bool r@@1))
)))
(assert (forall ((r@@2 Real) ) (! (= (real_to_bool r@@2) (ite (= r@@2 0.0) false true))
 :qid |peggybpl.224:23|
 :skolemid |16|
 :pattern ( (real_to_bool r@@2))
)))
(assert (forall ((x@@14 Real) (y Real) ) (! (= (min_real x@@14 y) (ite (<= x@@14 y) x@@14 y))
 :qid |peggybpl.238:19|
 :skolemid |20|
 :pattern ( (min_real x@@14 y))
)))
(assert (forall ((x@@15 Real) (y@@0 Real) ) (! (= (max_real x@@15 y@@0) (ite (>= x@@15 y@@0) x@@15 y@@0))
 :qid |peggybpl.242:19|
 :skolemid |21|
 :pattern ( (max_real x@@15 y@@0))
)))
(assert (forall ((x@@16 Real) ) (! (= (abs_real x@@16) (ite (>= x@@16 0.0) x@@16 (- 0.0 x@@16)))
 :qid |peggybpl.246:19|
 :skolemid |22|
 :pattern ( (abs_real x@@16))
)))
(assert (forall ((r@@3 Real) ) (!  (=> (>= r@@3 0.0) (= (* (sqrt_real r@@3) (sqrt_real r@@3)) r@@3))
 :qid |peggybpl.254:15|
 :skolemid |24|
 :pattern ( (sqrt_real r@@3))
)))
(assert (forall ((b Bool) ) (! (= (real_to_bool (bool_to_real b)) b)
 :qid |peggybpl.231:15|
 :skolemid |18|
 :pattern ( (real_to_bool (bool_to_real b)))
)))
(assert (forall ((r@@4 Real) ) (! (<= (floor_real r@@4) r@@4)
 :qid |peggybpl.262:15|
 :skolemid |27|
)))
(assert (forall ((r@@5 Real) ) (!  (and (<= (- (nearest_real r@@5) 0.5) r@@5) (<= r@@5 (+ (nearest_real r@@5) 0.5)))
 :qid |peggybpl.257:15|
 :skolemid |25|
 :pattern ( (nearest_real r@@5))
)))
(assert (forall ((b@@0 Bool) ) (! (= (bool_to_real b@@0) (ite b@@0 1.0 0.0))
 :qid |peggybpl.220:23|
 :skolemid |15|
 :pattern ( (bool_to_real b@@0))
)))
(assert (forall ((b@@1 Bool) ) (!  (or (= (bool_to_real b@@1) 0.0) (= (bool_to_real b@@1) 1.0))
 :qid |peggybpl.229:15|
 :skolemid |17|
 :pattern ( (bool_to_real b@@1))
)))
(assert (forall ((r@@6 Real) ) (! (= (nearest_real (nearest_real r@@6)) (nearest_real r@@6))
 :qid |peggybpl.259:15|
 :skolemid |26|
 :pattern ( (nearest_real r@@6))
)))
(assert (= global_2 1024.0))
(assert (= global_4 1024.0))
(assert (= global_5 1024.0))
(assert (= global_6 1056.0))
(assert (= global_1 2511.0))
(assert (= global_3 68048.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun c@1 () Int)
(declare-fun $sp@1 () Int)
(declare-fun argTmp@2 () Real)
(declare-fun $sp@6 () Int)
(declare-fun $stack@4 () (Array Int Real))
(declare-fun $stack@0 () (Array Int Real))
(declare-fun $sp@7 () Int)
(declare-fun $sp@8 () Int)
(declare-fun argTmp@1 () Real)
(declare-fun $sp@3 () Int)
(declare-fun $stack@2 () (Array Int Real))
(declare-fun $sp@4 () Int)
(declare-fun $sp@5 () Int)
(declare-fun $sp@2 () Int)
(declare-fun $mem_pages@0 () Int)
(declare-fun global_0@0 () Real)
(declare-fun $sp@0 () Int)
(set-info :boogie-vc-id BoogieEntry_peggy)
(set-option :timeout 0)
(set-option :rlimit 0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
(assert (not
 (=> (= (ControlFlow 0 0) 20) (let ((anon8_Else_correct  (=> (and (not (= c@1 2)) (= (ControlFlow 0 13) (- 0 12))) (<= 0 $sp@1))))
(let ((anon8_Then_correct  (=> (and (= c@1 2) (= argTmp@2 (to_real (to_int argTmp@2)))) (and (=> (= (ControlFlow 0 9) (- 0 11)) (<= 0 $sp@1)) (=> (<= 0 $sp@1) (=> (and (and (= $sp@6 (+ $sp@1 1)) (= (select $stack@4 $sp@1) argTmp@2)) (and (forall ((i Int) ) (!  (=> (not (= i $sp@1)) (= (select $stack@4 i) (select $stack@0 i)))
 :qid |peggybpl.302:17|
 :skolemid |29|
)) (<= 0 $sp@6))) (and (=> (= (ControlFlow 0 9) (- 0 10)) (>= $sp@7 1)) (=> (>= $sp@7 1) (=> (= $sp@8 (- $sp@7 1)) (=> (and (<= 0 $sp@8) (= (ControlFlow 0 9) (- 0 8))) (<= 0 $sp@8)))))))))))
(let ((anon7_Else_correct  (=> (not (= c@1 1)) (and (=> (= (ControlFlow 0 14) 9) anon8_Then_correct) (=> (= (ControlFlow 0 14) 13) anon8_Else_correct)))))
(let ((anon7_Then_correct  (=> (and (= c@1 1) (= argTmp@1 (to_real (to_int argTmp@1)))) (and (=> (= (ControlFlow 0 5) (- 0 7)) (<= 0 $sp@1)) (=> (<= 0 $sp@1) (=> (and (and (= $sp@3 (+ $sp@1 1)) (= (select $stack@2 $sp@1) argTmp@1)) (and (forall ((i@@0 Int) ) (!  (=> (not (= i@@0 $sp@1)) (= (select $stack@2 i@@0) (select $stack@0 i@@0)))
 :qid |peggybpl.302:17|
 :skolemid |29|
)) (<= 0 $sp@3))) (and (=> (= (ControlFlow 0 5) (- 0 6)) (>= $sp@4 1)) (=> (>= $sp@4 1) (=> (= $sp@5 (- $sp@4 1)) (=> (and (<= 0 $sp@5) (= (ControlFlow 0 5) (- 0 4))) (<= 0 $sp@5)))))))))))
(let ((anon6_Else_correct  (=> (not (= c@1 0)) (and (=> (= (ControlFlow 0 15) 5) anon7_Then_correct) (=> (= (ControlFlow 0 15) 14) anon7_Else_correct)))))
(let ((anon6_Then_correct  (=> (and (= c@1 0) (= (ControlFlow 0 3) (- 0 2))) (<= 0 $sp@2))))
(let ((anon5_LoopBody_correct  (=> (and (<= 0 c@1) (< c@1 3)) (and (=> (= (ControlFlow 0 16) 3) anon6_Then_correct) (=> (= (ControlFlow 0 16) 15) anon6_Else_correct)))))
(let ((anon5_LoopDone_correct true))
(let ((anon5_LoopHead_correct  (=> (<= 0 $sp@1) (and (=> (= (ControlFlow 0 17) 1) anon5_LoopDone_correct) (=> (= (ControlFlow 0 17) 16) anon5_LoopBody_correct)))))
(let ((anon0_correct  (=> (and (and (= $mem_pages@0 0) (= global_0@0 68048.0)) (and (= $sp@0 0) (<= 0 $sp@0))) (and (=> (= (ControlFlow 0 18) (- 0 19)) (<= 0 $sp@0)) (=> (<= 0 $sp@0) (=> (= (ControlFlow 0 18) 17) anon5_LoopHead_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 20) 18) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(get-info :rlimit)
(assert (not (= (ControlFlow 0 3) (- 2))))
(check-sat)
(get-info :reason-unknown)
(get-info :rlimit)
(assert (not (= (ControlFlow 0 5) (- 6))))
(check-sat)
(get-info :reason-unknown)
(get-info :rlimit)
(assert (not (= (ControlFlow 0 9) (- 10))))
(check-sat)
(get-info :rlimit)
(pop 1)
; Invalid
