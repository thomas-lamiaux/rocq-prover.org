let find p l =
  let rec aux i = function
    | [] -> None
    | x :: xs -> 
      if p x then Some i else aux (succ i) xs
  in aux 0 l

module Citations = 
struct 
  type t = (string list * int) ref (* Ordered by position in the reversed list *)

  let start : unit -> t = fun () -> ref ([], 0)

  let push cs slug =
    let (items, nitems) = !cs in
    let pos =
      match find (String.equal slug) items with
      | None -> let nitems = succ nitems in
        cs := (slug :: items, nitems);
        nitems
      | Some i -> nitems - i
    in pos

    let cite_label pos = "cite" ^ string_of_int pos

    let cite cs slug = 
      let pos = push cs slug in
      "#" ^ cite_label pos

    let citations cs =
      let (items, _nitems) = !cs in
      let cite i s = (string_of_int (succ i), cite_label (succ i), s) in
      List.mapi cite (List.rev items)
end