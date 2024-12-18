---
id: tour-of-rocq
title: A Tour of Rocq
description: >
  Hop on the Rocq sightseeing bus. This absolute beginner tutorial will drive you through the marvels and wonders of the Rocq prover. 
category: "First Steps"
recommended_next_tutorials:
  - "basic-data-types"
---


The Rocq prover is an interactive theorem prover. It means that it is designed to develop mathematical proofs, and especially to write formal specifications, programs and proofs that programs comply to their specifications. An interesting additional feature of Rocq is that it can automatically extract executable programs from specifications, as either OCaml or Haskell source code.

Properties, programs and proofs are formalized in the same language called the Calculus of Inductive Constructions (CIC). Then, all logical judgments in Rocq are typing judgments: the very heart of Rocq is in fact a type-checking algorithm.

## The language of Rocq

Rocq objects are sorted into three categories: the Prop sort, the SProp sort and the Type sort:


- `Prop` is the sort for propositions, i.e. well-formed propositions are of type `Prop`. Typical propositions are:

```ocaml
∀ A B : Prop, A /\ B -> B \/ B
∀ x y : Z, x * y = 0 -> x = 0 \/ y = 0
```

and new predicates can be defined either inductively, e.g.:

```ocaml
Inductive even : N -> Prop :=
  | even_0 : even 0
  | even_S n : odd n -> even (n + 1)
  with odd : N -> Prop :=
  | odd_S n : even n -> odd (n + 1).
```

or by abstracting over other existing propositions, e.g.:

```ocaml
Definition divide (x y:N) := ∃ z, x * z = y.
Definition prime x := ∀ y, divide y x -> y = 1 \/ y = x.
```

- `Type` is the sort for datatypes and mathematical structures, i.e. well-formed types or structures are of type Type. Here is e.g. a basic example of type:

```ocaml
 Z -> Z * Z
 ```

 Types can be inductive structures, e.g.:

 ```ocaml
Inductive nat : Set :=
  | 0 : nat
  | S : nat -> nat.

Inductive list (A:Type) : Type :=
  | nil : list A
  | cons : A -> list A -> list A.
 ```

 or types for tuples, e.g.:

 ```ocaml
Structure monoid := { 
    dom : Type ; 
    op : dom -> dom -> dom where "x * y" := (op x y); 
    id : dom where "1" := id; 
    assoc : ∀ x y z, x * (y * z) = (x * y) * z ; 
    left_neutral : ∀ x, 1 * x = x ;
    right_neutral : ∀ x, x * 1 = x 
  }.
 ```

 or a form of subset types called Σ-types, e.g. the type of even natural numbers:

```ocaml
 {n : N | even n}
```

rocq implements a functional programming language supporting these types. For instance, the pairing function of type `Z -> Z * Z` is written `fun x => (x,x)` and `cons (S (S O)) (cons (S O) nil)` (shortened to `2::1::nil` in Rocq) denotes a list of type list nat made of the two elements `2` and `1`.
Using Σ-types, a sorting function over lists of natural numbers can be given the type:
```ocaml
sort : ∀ (l : list nat), {l' : list nat | sorted l' /\ same_elements l l'}
```

Such a type (specification) enforces the user to write the proofs of predicates `sorted l'` and `same_elements l l'` when writing a implementation for the function sort.

Then, functions over inductive types are expressed using a case analysis:

```ocaml
Fixpoint plus (n m:nat) {struct n} : nat :=
  match n with
  | O => m
  | S p => S (p + m)
  end
where "p + m" := (plus p m).
```

Rocq can now be used as an interactive evaluator. Issuing the command

```ocaml
Eval compute in (43+55)
```

(where 43 and 55 denote the natural numbers with respectively 43 and 55 successors) returns

```ocaml
 98 : nat
 ```

 ## Proving in Rocq

Proof development in rocq is done through a language of tactics that allows a user-guided proof process. At the end, the curious user can check that tactics build lambda-terms. For example the tactic intro n, where n is of type nat, builds the term (with a hole):

```ocaml
fun (n:nat) => _ 
```

where `_` represents a term that will be constructed after, using other tactics.

Here is an example of a proof in the Coq system:

```ocaml
  Inductive seq : nat -> Set :=
  | niln : seq 0
  | consn : forall n : nat, nat -> seq n -> seq (S n).

  Fixpoint length (n : nat) (s : seq n) {struct s} : nat := 
    match s with
    | niln => 0
    | consn i _ s' => S (length i s')
    end.

  Theorem length_corr : forall (n : nat) (s : seq n), length n s = n.
  Proof.
    intros n s.

    (* reasoning by induction over s. Then, we have two new goals
       corresponding on the case analysis about s (either it is 
       niln or some consn *)
    induction s.

      (* We are in the case where s is void. We can reduce the 
         term: length 0 niln *)
      simpl. 

      (* We obtain the goal 0 = 0. *)
      trivial.

      (* now, we treat the case s = consn n e s with induction 
         hypothesis IHs *)
      simpl. 

      (* The induction hypothesis has type length n s = n. 
         So we can use it to perform some rewriting in the goal: *)
      rewrite IHs. 

      (* Now the goal is the trivial equality: S n = S n *)
      trivial.

    (* Now all sub cases are closed, we perform the ultimate
       step: typing the term built using tactics and save it as
       a witness of the theorem. *)
  Qed.	  
```

Using the `Print` command, the user can look at the proof-term generated using the tactics:
```ocaml
  length_corr =
    fun (n : nat) (s : seq n) =>
      seq_ind (fun (n0 : nat) (s0 : seq n0) => length n0 s0 = n0) 
        (refl_equal 0)
        (fun (n0 _ : nat) (s0 : seq n0) (IHs : length n0 s0 = n0) =>
          eq_ind_r 
            (fun n2 : nat => S n2 = S n0) 
            (refl_equal (S n0)) IHs) n s
  : forall (n : nat) (s : seq n), length n s = n
```