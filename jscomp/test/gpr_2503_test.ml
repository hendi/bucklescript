let suites = ref []
let test_id = ref 0 
let eq loc x y = Mt.eq_suites ~suites ~test_id loc x y 

let b loc b = Mt.bool_suites ~suites ~test_id loc b 
(* TODO:*)


external make: ?foo:([`a|`b] [@bs.string]) -> unit -> _ = "" [@@bs.obj]

let makeWrapper ?foo () = Js.log (make ?foo ())

external make2: foo:([`a|`b] [@bs.string]) -> unit -> _ = "" [@@bs.obj]

let makeWrapper2 foo () = Js.log (make2 foo ())

let _ = 
  makeWrapper2 `a () 


external make3: ?foo:([`a|`b] [@bs.string]) -> unit -> _ = "" [@@bs.obj]

let makeWrapper3 ?foo () = Js.log 2;  (make ?foo ())  
  
;; b __LOC__ 
( Js.eqUndefined "a" (makeWrapper3 ~foo:`a ())##foo)

;; b __LOC__ 
( Js.undefined =  (makeWrapper3  ())##foo)


;; Mt.from_pair_suites __FILE__ !suites  