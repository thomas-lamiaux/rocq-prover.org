---
id: tour-of-rocq
title: A Tour of Rocq
description: >
  Hop on the Rocq sightseeing bus. This absolute beginner tutorial will drive you through the marvels and wonders of the Rocq Prover.
category: "First Steps"
recommended_next_tutorials:
---

<div class="document">
<div class="alectryon-container docutils container">
<p>The Rocq Prover is an interactive theorem prover. It means that it is designed to develop mathematical proofs, and especially to write formal specifications, programs and proofs that programs comply to their specifications. An interesting additional feature of Rocq is that it can automatically extract executable programs from specifications, as either OCaml or Haskell source code.</p>
<p>Properties, programs and proofs are formalized in the same language called the Calculus of Inductive Constructions (CIC). Then, all logical judgments in Rocq are typing judgments: the very heart of Rocq is in fact a type-checking algorithm.</p>
<div class="section" id="the-language-of-rocq">
<h1>The language of Rocq</h1>
<p>Rocq objects are sorted into three categories: the Prop sort, the SProp sort and the Type sort:</p>
<ul class="simple">
<li><code class="highlight coq"><span class="kt">Prop</span></code> is the sort for propositions, i.e. well-formed propositions are of type <code class="highlight coq"><span class="kt">Prop</span></code>. Typical propositions are:</li>
</ul>
<pre class="code coq literal-block">
<span class="kr">∀</span> <span class="nv">A</span> <span class="nv">B</span> <span class="o">:</span> <span class="kt">Prop</span><span class="o">,</span> <span class="n">A</span> <span class="o">/\</span> <span class="n">B</span> <span class="o">-&gt;</span> <span class="n">B</span> <span class="o">\/</span> <span class="n">B</span>
<span class="kr">∀</span> <span class="nv">x</span> <span class="nv">y</span> <span class="o">:</span> <span class="n">Z</span><span class="o">,</span> <span class="n">x</span> <span class="o">*</span> <span class="n">y</span> <span class="o">=</span> <span class="mi">0</span> <span class="o">-&gt;</span> <span class="n">x</span> <span class="o">=</span> <span class="mi">0</span> <span class="o">\/</span> <span class="n">y</span> <span class="o">=</span> <span class="mi">0</span>
</pre>
<p>and new predicates can be defined either inductively, e.g.:</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Inductive</span> <span class="nf">even</span> : N -&gt; <span class="kt">Prop</span> :=
  | even_0 : even <span class="mi">0</span>
  | even_S n : odd n -&gt; even (n + <span class="mi">1</span>)
<span class="kr">with</span> odd : N -&gt; <span class="kt">Prop</span> :=
  | odd_S n : even n -&gt; odd (n + <span class="mi">1</span>).</span></span></pre><p>or by abstracting over other existing propositions, e.g.:</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Definition</span> <span class="nf">divide</span> (<span class="nv">x</span> <span class="nv">y</span>:N) := <span class="kr">exists</span> <span class="nv">z</span>, x * z = y.</span><span class="alectryon-wsp">
</span></span><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Definition</span> <span class="nf">prime</span> <span class="nv">x</span> := <span class="kr">∀</span> <span class="nv">y</span>, divide y x -&gt; y = <span class="mi">1</span> \/ y = x.</span></span></pre><ul class="simple">
<li><code class="highlight coq"><span class="kt">Type</span></code> is the sort for datatypes and mathematical structures, i.e. well-formed types or structures are of type <code class="highlight coq"><span class="kt">Type</span></code>. Here is e.g. a basic example of type:
<code class="highlight coq"><span class="n">Z</span> <span class="o">-&gt;</span> <span class="n">Z</span> <span class="o">*</span> <span class="n">Z</span></code></li>
</ul>
<p>Types can be inductive structures, e.g.:</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Inductive</span> <span class="nf">nat</span> : <span class="kt">Set</span> :=
  | O : nat
  | S : nat -&gt; nat.</span><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
</span><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Inductive</span> <span class="nf">list</span> (<span class="nv">A</span>:<span class="kt">Type</span>) : <span class="kt">Type</span> :=
  | nil : list A
  | cons : A -&gt; list A -&gt; list A.</span></span></pre><p>or types for tuples, e.g.:</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Structure</span> <span class="nf">monoid</span> := { 
   dom : <span class="kt">Type</span> ; 
   op : dom -&gt; dom -&gt; dom <span class="kn">where</span> <span class="s2">&quot;x * y&quot;</span> := (op x y); 
   id : dom <span class="kn">where</span> <span class="s2">&quot;1&quot;</span> := id; 
   assoc : <span class="kr">∀</span> <span class="nv">x</span> <span class="nv">y</span> <span class="nv">z</span>, x * (y * z) = (x * y) * z ; 
   left_neutral : <span class="kr">∀</span> <span class="nv">x</span>, <span class="mi">1</span> * x = x ;
   right_neutral : <span class="kr">∀</span> <span class="nv">x</span>, x * <span class="mi">1</span> = x 
 }.</span></span></pre><p>or a form of subset types called Σ-types, e.g. the type of even natural numbers:</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk0" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk0"><span class="kn">Check</span> {n : N | even n}.</label><small class="alectryon-output"><div><div class="alectryon-messages"><blockquote class="alectryon-message">{n : N | even n}
     : <span class="kt">Set</span></blockquote></div></div></small></span></pre><p>Rocq implements a functional programming language supporting these types. For instance, the pairing function of type <code class="highlight coq"><span class="n">Z</span> <span class="o">-&gt;</span> <span class="n">Z</span> <span class="o">*</span> <span class="n">Z</span></code> is written <code class="highlight coq"><span class="kr">fun</span> <span class="nv">x</span> <span class="o">=&gt;</span> <span class="o">(</span><span class="n">x</span><span class="o">,</span><span class="n">x</span><span class="o">)</span></code> and <code class="highlight coq"><span class="n">cons</span> <span class="o">(</span><span class="n">S</span> <span class="o">(</span><span class="n">S</span> <span class="n">O</span><span class="o">))</span> <span class="o">(</span><span class="n">cons</span> <span class="o">(</span><span class="n">S</span> <span class="n">O</span><span class="o">)</span> <span class="n">nil</span><span class="o">)</span></code> (shortened to <code class="highlight coq"><span class="mi">2</span><span class="o">::</span><span class="mi">1</span><span class="o">::</span><span class="n">nil</span></code> in Rocq) denotes a list of type list nat made of the two elements <code class="highlight coq"><span class="mi">2</span></code> and <code class="highlight coq"><span class="mi">1</span></code>.
Using Σ-types, a sorting function over lists of natural numbers can be given the type:</p>
<pre class="code coq literal-block">
<span class="n">sort</span> <span class="o">:</span> <span class="kr">∀</span> <span class="o">(</span><span class="nv">l</span> <span class="o">:</span> <span class="n">list</span> <span class="n">nat</span><span class="o">),</span> <span class="o">{</span><span class="n">l'</span> <span class="o">:</span> <span class="n">list</span> <span class="n">nat</span> <span class="o">|</span> <span class="n">sorted</span> <span class="n">l'</span> <span class="o">/\</span> <span class="n">same_elements</span> <span class="n">l</span> <span class="n">l'</span><span class="o">}</span>
</pre>
<p>Such a type (specification) enforces the user to write the proofs of predicates <code class="highlight coq"><span class="n">sorted</span> <span class="n">l'</span></code> and <code class="highlight coq"><span class="n">same_elements</span> <span class="n">l</span> <span class="n">l'</span></code> when writing a implementation for the function sort.</p>
<p>Then, functions over inductive types are expressed using a case analysis:</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk1" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk1"><span class="kn">Fixpoint</span> <span class="nf">plus</span> (<span class="nv">n</span> <span class="nv">m</span>:nat) {<span class="nv">struct</span> <span class="nv">n</span>} : nat :=
  <span class="kr">match</span> n <span class="kr">with</span>
  | O =&gt; m
  | S p =&gt; S (plus p m)
  <span class="kr">end</span>.</label></span></pre><p>The Rocq Prover can now be used as an interactive evaluator. Issuing the command</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk2" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk2"><span class="kn">Eval</span> <span class="nb">compute</span> <span class="kr">in</span> (plus <span class="mi">43</span> <span class="mi">55</span>).</label><small class="alectryon-output"><div><div class="alectryon-messages"><blockquote class="alectryon-message">= <span class="mi">98</span>
: nat</blockquote></div></div></small></span></pre><p>(where 43 and 55 denote the natural numbers with respectively 43 and 55 successors) returns</p>
<pre class="code coq literal-block">
 <span class="mi">98</span> <span class="o">:</span> <span class="n">nat</span>
</pre>
</div>
<div class="section" id="proving-in-rocq">
<h1>Proving in Rocq</h1>
<p>Proof development in Rocq is done through a language of tactics that allows a user-guided proof process. At the end, the curious user can check that tactics build lambda-terms. For example the tactic intro n, where n is of type nat, builds the term (with a hole):</p>
<pre class="code coq literal-block">
<span class="kr">fun</span> <span class="o">(</span><span class="nv">n</span><span class="o">:</span><span class="n">nat</span><span class="o">)</span> <span class="o">=&gt;</span> <span class="n">_</span> 
</pre>
<p>where <tt class="docutils literal">_</tt> represents a term that will be constructed after, using other tactics.</p>
<p>Here is an example of a proof in the Rocq Prover:</p>
<pre class="alectryon-io highlight"><!-- Generator: Alectryon --><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Inductive</span> <span class="nf">seq</span> : nat -&gt; <span class="kt">Set</span> :=
| niln : seq <span class="mi">0</span>
| consn : <span class="kr">forall</span> <span class="nv">n</span> : nat, nat -&gt; seq n -&gt; seq (S n).</span><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
</span><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Fixpoint</span> <span class="nf">length</span> (<span class="nv">n</span> : nat) (<span class="nv">s</span> : seq n) {<span class="nv">struct</span> <span class="nv">s</span>} : nat :=
  <span class="kr">match</span> s <span class="kr">with</span>
  | niln =&gt; <span class="mi">0</span>
  | consn i _ s&#39; =&gt; S (length i s&#39;)
  <span class="kr">end</span>.</span><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
</span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk3" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk3"><span class="kn">Theorem</span> <span class="nf">length_corr</span> : <span class="kr">forall</span> (<span class="nv">n</span> : nat) (<span class="nv">s</span> : seq n), length n s = n.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><span class="goal-separator"><hr></span><div class="goal-conclusion"><span class="kr">∀</span> (<span class="nv">n</span> : nat) (<span class="nv">s</span> : seq n), length n s = n</div></blockquote></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk4" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk4"><span class="kn">Proof</span>.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><span class="goal-separator"><hr></span><div class="goal-conclusion"><span class="kr">∀</span> (<span class="nv">n</span> : nat) (<span class="nv">s</span> : seq n), length n s = n</div></blockquote></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">  </span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk5" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk5"><span class="nb">intros</span> n s.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><div class="goal-hyps"><span><var>n</var><span class="hyp-type"><b>: </b><span>nat</span></span></span><br><span><var>s</var><span class="hyp-type"><b>: </b><span>seq n</span></span></span><br></div><span class="goal-separator"><hr></span><div class="goal-conclusion">length n s = n</div></blockquote></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
  <span class="c">(* reasoning by induction over s. Then, we have two new goals</span>
<span class="c">      corresponding on the case analysis about s (either it is</span>
<span class="c">      niln or some consn *)</span>
</span><span class="alectryon-wsp">  </span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk6" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk6"><span class="nb">induction</span> s.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><span class="goal-separator"><hr></span><div class="goal-conclusion">length <span class="mi">0</span> niln = <span class="mi">0</span></div></blockquote><div class="alectryon-extra-goals"><input class="alectryon-extra-goal-toggle" id="a-tour-of-rocq-md-orig-chk7" style="display: none" type="checkbox"><blockquote class="alectryon-goal"><div class="goal-hyps"><span><var>n, n0</var><span class="hyp-type"><b>: </b><span>nat</span></span></span><br><span><var>s</var><span class="hyp-type"><b>: </b><span>seq n</span></span></span><br><span><var>IHs</var><span class="hyp-type"><b>: </b><span>length n s = n</span></span></span><br></div><label class="goal-separator" for="a-tour-of-rocq-md-orig-chk7"><hr></label><div class="goal-conclusion">length (S n) (consn n n0 s) = S n</div></blockquote></div></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
    <span class="c">(* We are in the case where s is void. We can reduce the</span>
<span class="c">        term: length 0 niln *)</span>
</span><span class="alectryon-wsp">    </span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chk8" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chk8"><span class="nb">simpl</span>.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><span class="goal-separator"><hr></span><div class="goal-conclusion"><span class="mi">0</span> = <span class="mi">0</span></div></blockquote><div class="alectryon-extra-goals"><input class="alectryon-extra-goal-toggle" id="a-tour-of-rocq-md-orig-chk9" style="display: none" type="checkbox"><blockquote class="alectryon-goal"><div class="goal-hyps"><span><var>n, n0</var><span class="hyp-type"><b>: </b><span>nat</span></span></span><br><span><var>s</var><span class="hyp-type"><b>: </b><span>seq n</span></span></span><br><span><var>IHs</var><span class="hyp-type"><b>: </b><span>length n s = n</span></span></span><br></div><label class="goal-separator" for="a-tour-of-rocq-md-orig-chk9"><hr></label><div class="goal-conclusion">length (S n) (consn n n0 s) = S n</div></blockquote></div></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
    <span class="c">(* We obtain the goal 0 = 0. *)</span>
</span><span class="alectryon-wsp">    </span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chka" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chka"><span class="nb">trivial</span>.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><div class="goal-hyps"><span><var>n, n0</var><span class="hyp-type"><b>: </b><span>nat</span></span></span><br><span><var>s</var><span class="hyp-type"><b>: </b><span>seq n</span></span></span><br><span><var>IHs</var><span class="hyp-type"><b>: </b><span>length n s = n</span></span></span><br></div><span class="goal-separator"><hr></span><div class="goal-conclusion">length (S n) (consn n n0 s) = S n</div></blockquote></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
    <span class="c">(* now, we treat the case s = consn n e s with induction</span>
<span class="c">        hypothesis IHs *)</span>
</span><span class="alectryon-wsp">    </span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chkb" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chkb"><span class="nb">simpl</span>.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><div class="goal-hyps"><span><var>n, n0</var><span class="hyp-type"><b>: </b><span>nat</span></span></span><br><span><var>s</var><span class="hyp-type"><b>: </b><span>seq n</span></span></span><br><span><var>IHs</var><span class="hyp-type"><b>: </b><span>length n s = n</span></span></span><br></div><span class="goal-separator"><hr></span><div class="goal-conclusion">S (length n s) = S n</div></blockquote></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
    <span class="c">(* The induction hypothesis has type length n s = n.</span>
<span class="c">        So we can use it to perform some rewriting in the goal: *)</span>
</span><span class="alectryon-wsp">    </span><span class="alectryon-sentence"><input class="alectryon-toggle" id="a-tour-of-rocq-md-orig-chkc" style="display: none" type="checkbox"><label class="alectryon-input" for="a-tour-of-rocq-md-orig-chkc"><span class="nb">rewrite</span> IHs.</label><small class="alectryon-output"><div><div class="alectryon-goals"><blockquote class="alectryon-goal"><div class="goal-hyps"><span><var>n, n0</var><span class="hyp-type"><b>: </b><span>nat</span></span></span><br><span><var>s</var><span class="hyp-type"><b>: </b><span>seq n</span></span></span><br><span><var>IHs</var><span class="hyp-type"><b>: </b><span>length n s = n</span></span></span><br></div><span class="goal-separator"><hr></span><div class="goal-conclusion">S n = S n</div></blockquote></div></div></small><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
    <span class="c">(* Now the goal is the trivial equality: S n = S n *)</span>
</span><span class="alectryon-wsp">    </span><span class="alectryon-sentence"><span class="alectryon-input"><span class="nb">trivial</span>.</span><span class="alectryon-wsp">
</span></span><span class="alectryon-wsp">
  <span class="c">(* Now all sub cases are closed, we perform the ultimate</span>
<span class="c">      step: typing the term built using tactics and save it as</span>
<span class="c">      a witness of the theorem. *)</span>
</span><span class="alectryon-sentence"><span class="alectryon-input"><span class="kn">Qed</span>.</span></span></pre><p>Using the <tt class="docutils literal">Print</tt> command, the user can look at the proof-term generated using the tactics:</p>
<pre class="code coq literal-block">
  <span class="n">length_corr</span> <span class="o">=</span>
    <span class="kr">fun</span> <span class="o">(</span><span class="nv">n</span> <span class="o">:</span> <span class="n">nat</span><span class="o">)</span> <span class="o">(</span><span class="nv">s</span> <span class="o">:</span> <span class="n">seq</span> <span class="n">n</span><span class="o">)</span> <span class="o">=&gt;</span>
      <span class="n">seq_ind</span> <span class="o">(</span><span class="kr">fun</span> <span class="o">(</span><span class="nv">n0</span> <span class="o">:</span> <span class="n">nat</span><span class="o">)</span> <span class="o">(</span><span class="nv">s0</span> <span class="o">:</span> <span class="n">seq</span> <span class="n">n0</span><span class="o">)</span> <span class="o">=&gt;</span> <span class="n">length</span> <span class="n">n0</span> <span class="n">s0</span> <span class="o">=</span> <span class="n">n0</span><span class="o">)</span> 
        <span class="o">(</span><span class="n">refl_equal</span> <span class="mi">0</span><span class="o">)</span>
        <span class="o">(</span><span class="kr">fun</span> <span class="o">(</span><span class="nv">n0</span> <span class="nv">_</span> <span class="o">:</span> <span class="n">nat</span><span class="o">)</span> <span class="o">(</span><span class="nv">s0</span> <span class="o">:</span> <span class="n">seq</span> <span class="n">n0</span><span class="o">)</span> <span class="o">(</span><span class="nv">IHs</span> <span class="o">:</span> <span class="n">length</span> <span class="n">n0</span> <span class="n">s0</span> <span class="o">=</span> <span class="n">n0</span><span class="o">)</span> <span class="o">=&gt;</span>
          <span class="n">eq_ind_r</span> 
            <span class="o">(</span><span class="kr">fun</span> <span class="nv">n2</span> <span class="o">:</span> <span class="n">nat</span> <span class="o">=&gt;</span> <span class="n">S</span> <span class="n">n2</span> <span class="o">=</span> <span class="n">S</span> <span class="n">n0</span><span class="o">)</span> 
            <span class="o">(</span><span class="n">refl_equal</span> <span class="o">(</span><span class="n">S</span> <span class="n">n0</span><span class="o">))</span> <span class="n">IHs</span><span class="o">)</span> <span class="n">n</span> <span class="n">s</span>
  <span class="o">:</span> <span class="kr">forall</span> <span class="o">(</span><span class="nv">n</span> <span class="o">:</span> <span class="n">nat</span><span class="o">)</span> <span class="o">(</span><span class="nv">s</span> <span class="o">:</span> <span class="n">seq</span> <span class="n">n</span><span class="o">),</span> <span class="n">length</span> <span class="n">n</span> <span class="n">s</span> <span class="o">=</span> <span class="n">n</span>
</pre>
</div>
</div>
</div>
