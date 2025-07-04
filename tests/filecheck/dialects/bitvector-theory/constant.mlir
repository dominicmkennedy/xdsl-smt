// RUN: xdsl-smt "%s" | xdsl-smt -t=smt | filecheck "%s"
// RUN: xdsl-smt "%s" -t=smt | z3 -in

"builtin.module"() ({

  %three = smt.bv.constant #smt.bv<3> : !smt.bv<32>
  %four = smt.bv.constant #smt.bv<4> : !smt.bv<32>
  %eq = "smt.eq"(%three, %four) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
  "smt.assert"(%eq) : (!smt.bool) -> ()
  // CHECK: (assert (= (_ bv3 32) (_ bv4 32)))

}) : () -> ()
