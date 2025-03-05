---
title: Rocq Governance ⋅ 🚧 Draft 🚧
description: The structure of the Rocq Projects, the roles involved and the responsibilities.
meta_title: Governance of the Rocq Projects
meta_description: Read about the structure of the Rocq Projects, the roles involved and the responsibilities.
---

<img src="/img/global/warning-icon.svg" class="w-40"/>
  Warning: this Rocq Governance "constitution" is a draft and has not yet been 
  reviewed or approved by the Rocq Core team

## I. Introduction

### A. Overview and Scope

The Rocq ecosystem is continually expanding, encompassing a growing number of
collective endeavors aimed at supporting, extending, and enriching the language
and its user base. This document provides governance details for the *official*
Rocq Projects, that is:

- The Rocq Prover runtime (rocq-prover/rocq)
- The official distribution methods:
  - The [Rocq Platform](/platform) (rocq-prover/platform)
  - The [Rocq opam repository](/packages) (rocq-prover/opam)
  - The Docker-Rocq images (rocq-prover/docker-rocq)
- The official extensions, user interfaces and tools:
  - The Rocq Stdlib
  - The Equations plugin
  - The VsRocq package for VS Code (rocq-prover/vsrocq)
  - The Docker Opam Action (rocq-prover/docker-opam-action)
  - The ROCQbot development tool (rocq-prover/bot)
- The official documentation and communication channels:
  - The rocq-prover.org website (rocq-prover/rocq-prover.org)
  - The Rocq Platform Docs (rocq-prover/platform-docs)
  - The Rocq workshops
  - The Discourse forum
  - The Zulip chat
  - The mailing lists (currently Coq-Club and Coqdev)
  - The social media accounts (currently CoqLang on X/Twitter)

Community projects, such as the Rocq-community organization, are not covered by
this governance document.

The document outlines the reporting structure, details the roles involved, and
delineates the responsibilities of each project that falls under this
governance. The goal is to balance efficient operation with comprehensive
transparency, eschewing needless complexity while upholding a clear, effective
governance model.

### B. Purpose - A Document That Represents Reality

At any given time, this document must reflect the *current reality*. It is *not*
intended to be aspirational nor reflect the kind of structures that people may
expect to see. This is an important point because the utility of this document
is limited to the extent that it represents how things *really* are, as opposed
to how people may *desire* them to be in the future. As the environment changes,
this document should also be updated such that it consistently reflects how
things are.

### C. Guiding Principles

The Rocq governance is guided by key principles such as openness, community focus, 
and compatibility. Each project that falls under the Rocq governance should align with these
principles, fostering a community that is open, collaborative, and dedicated to
the continued development and advancement of the Rocq Prover and its
applications.

## II. Roles and responsibilities

### A. Core Team and Project Leader

The [Rocq Core](/rocq-team/governance#Core) team is composed of a set of voluntary, co-opted
Maintainers that govern the development of the Rocq Prover and official Rocq Projects.
It is the role of the Core team to resolve disputes that may arise in relation to
the official Rocq Projects, specifically to ensure that
these projects are able to progress in a coordinated way.

The Rocq Core team has a formal [voting process](https://github.com/coq/coq/wiki/Core-Team-Voting-Process) 
that can be used to resolve conflicts in case consensus cannot be reached.

Yearly, the Core Team designate a Project Leader among them, who is in charge of representing the 
Core Team and maintaing the long term vision of the Rocq Prover and official Rocq Projects. 
The Project Leader is tacitly reconducted each calendar year, unless a Core Team member asks for a vote
or the Project Leader decides to resign. The current Project Leader is Matthieu Sozeau.

It is the community's role to guide the decisions of the Core Team through active engagement,
contributions, and discussions. To foster a healthy and growing community, the
Project Leader will make the goals and decisions clear and public.

It is anticipated that the Projects themselves will be self-managing and will
resolve issues within their communities, without recourse to the Project Leader. Where
the Project Leader needs to become involved, he/she will act as arbitrator.

### B. Delegates

The Project Leader may choose to delegate authority to others to manage a subproject and
act in the Project Leader's name, though ultimate arbitration
and power to remove the delegation of authority remains with the Project Leader. Those
Delegates (or Team Leaders) are free to choose how they arrange themselves
and the composition of their team, in agreement with the
Project Leader. In the specific case of disputes, the Delegate(s) will consult with the
Project Leader, who will act as arbitrator if required.

### C. Maintainers

Projects under Rocq governance will have their own Maintainers, who have commit
access to relevant repositories and are responsible for:

- Managing the specific project.
- Writing code directly to repositories.
- Eliciting and screening the contributions of others.
- Ensuring that the Project Leader, Rocq Coordinator, and Delegates/Team Leaders are aware of community needs.

Generally, Maintainers only have authority over the specific Projects they are
responsible for though it is expected that Maintainers of different Projects
will collaborate frequently, especially in the case of major changes or
announcements. Typically, individuals who have made substantive contributions to
a Project will be invited to become Maintainers.

### D. Contributors

Contributors are wider members of the Rocq community who make valuable
contributions to projects under Rocq governance, but generally do not have
authority to make direct changes to a Project's codebase or documentation.
Anyone can become a Contributor and there is no expectation of commitment, no
specific skill requirement, and no selection process. The only necessary step is
to make or suggest some improvement or change to the Project.

Contributors can interact with a Project via tools such as Zulip channels, issue
trackers, and wiki pages, for example. Maintainers are free to direct discussion
to their own public preferred communication platform, as
they feel appropriate. Those whose contributions are accepted will be recognised
in some form on a public website as thanks.

It is expected that regular Contributors to specific Projects may be asked if
they wish to become Maintainers, as described above. There is no obligation to
accept such an offer.

### E. Users

Users are the most important group and it includes the much wider community of
anyone who interacts with Rocq Projects in any way. This covers all
web-visitors, users of the Rocq Prover and members of discussion channels.
Without Users, the Projects serve no purpose, so the impact of any major
decisions on this group should be assessed.

Wherever practicable, Users should be encouraged to provide feedback and
participate in the Projects as much as possible. Users who engage a lot with a
Project will likely go on to become Contributors.

It should be noted that these Roles are not mutually exclusive, for example
Maintainers and Contributors are typically also Users.

## III. Processes

### A. Decision Making and Communication

The preferred approach for most discussions is through
[rough consensus and running code](http://en.wikipedia.org/wiki/Rough_consensus).
Discussions should be public and take place on official Project communication channels,
typically the Rocq Zulip chat or the relevant issue trackers. Users and
Contributors are encouraged to take part and voice their opinions. Typically,
the Maintainers of a Project will make the final decision, having accounted for
wider views.

All Projects under the Rocq governance are to be documented such that Users can
find out about them and understand both the purpose and how they can contribute.

### B. Contribution Process and Licensing

Each Project under the Rocq governance needs to define a clear contribution
process and licensing agreement so that Contributors understand how to engage
with the Maintainers. Typically, this will cover where communication occurs and
the process for submitting patches. Contributions from the community are
encouraged and can take many forms including, bug fixes, new features, content,
or documentation.

All Projects under the Rocq governance are expected to be open source, and the
licensing arrangements should reflect this.

### C. Dispute Resolution

Maintainers are expected to make decisions regarding their Projects. The intent
is for any Maintainers to resolve disagreements, through a consensus process
within each Project.

On the rare occasions, where Maintainers of a Project cannot agree on a way
forward, the following approach is suggested:

- The specific issue(s) will need to be articulated, so it is clear what needs
  to be discussed.
- Other Maintainers of Rocq Projects will be asked for their views.
- If the discussion still cannot be resolved, the Project Leader (or Delegates) will
  act as arbitrator.

During the above, it is expected that all people will be reasonable and
respectful of each other's efforts and viewpoints. In general, we expect to
generate consensus among the community to resolve conflicts.

The [Code of Conduct](/code-of-conduct) should be followed at all times.
Maintainers that do not follow the Code of Conduct may be removed from their
role by the [Code of Conduct enforcement team](/rocq-team/community#Code%20of%20Conduct%20Enforcement)
(acting on behalf of the Project Leader).

****

<!--
The version number should be changed for *any* edits that are made to this
document, even typos. Otherwise disambiguating between versions is awkward.
-->

**Version 0.2 - February 28th 2025**

- This version is simplifying the organization by removing the informal Rocq Coordination team, to
  better reflect the desired horizontal organization of the Rocq team, with a potentially changing Project Lead.

**Version 0.1 - December 24th 2024**

- This first version of the document was adapted from the [OCaml governance](https://ocaml.org/policies/governance/)
  by the Rocq Coordination team, attempting to describe the current reality of the Rocq governance
  for discussion by the Rocq Core team. 