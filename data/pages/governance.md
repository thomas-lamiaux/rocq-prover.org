---
title: Rocq Governance ⋅ 🚧 Draft 🚧
description: The structure of the Rocq projects, the roles involved and the responsibilities.
meta_title: Governance of the Rocq projects and domain
meta_description: Read about the structure of the Rocq projects, the roles involved and the responsibilities.
---

<img src="/img/global/warning-icon.svg" class="w-40"/>
  Warning: this Rocq Governance "constitution" is a draft and has not yet been 
  reviewed or approved by the Rocq Core team

## I. Introduction

### A. Overview and Scope

The Rocq ecosystem is continually expanding, encompassing a growing number of
collective endeavors aimed at supporting, extending, and enriching the language
and its user base. This document provides governance details for:

1. The rocq-prover.org *domain name* and its associated projects.
2. The Rocq Platform - the recommended set of tools for the Rocq Prover.

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

### D. Guiding Principles

The Rocq governance, inclusive of rocq-prover.org and the Rocq Platform, is guided
by key principles such as openness, community focus, and compatibility. Each
project that falls under the Rocq governance should align with these
principles, fostering a community that is open, collaborative, and dedicated to
the continued development and advancement of the Rocq Prover and its
applications.

## II. Roles and responsibilities

### A. Owner, Coordination Team and Core Team

The Owner of the rocq-prover.org domain and the Rocq Prover software and the 
Rocq Platform is Matthieu Sozeau, the lead developer of the Rocq Prover. The Owner can 
appoint a team of [Rocq Coordinators]("/governance/governance#coordination")
to help with coordination tasks, who have the right to act in the name of the Owner 
in all matters of coordination. 

* Currently, Matthieu Sozeau has appointed Théo Zimmermann, Nicolas Tabareau and Yves Bertot
as Rocq Coordinators, who have accepted this Role *

The [Rocq Core]("/governance/governance#core") team is composed of the Rocq Coordinators and 
a set of voluntary, co-opted Maintainers that govern the development of the rocq-prover.org 
domain and the Rocq Prover software. The [Rocq Platform]("/governance/distribution") team is 
composed of voluntary, co-opted Maintainers that govern the development of the Rocq Platform.

Projects under rocq-prover.org sub-domains and within the Rocq Platform are managed
by the community, meaning that it is the community that actively contributes to the 
day-to-day maintenance of these initiatives, but the general strategic direction is 
drawn by the Core team and the Plaform team.

It is the role of the Owner and the Core team to resolve disputes that may arise in relation to
rocq-prover.org, the Rocq Prover or the Rocq Platform, specifically to ensure that 
the projects within these domains are able to progress in a coordinated way. 

It is the community's role to guide the decisions of the Owner through active engagement,
contributions, and discussions. To foster a healthy and growing community, the
Owner will make the goals and decisions clear and public.

It is anticipated that the Projects themselves will be self-managing and will
resolve issues within their communities, without recourse to the Owner. Where
the Owner needs to become involved, he/she will act as arbitrator.

### B. Delegates

The Owner may choose to delegate authority to others to manage a subproject and
act in the Owner's name, though ownership remains with the Owner. Those
Delegates are free to choose how they arrange themselves, in agreement with the
Owner. In the specific case of disputes, the Delegate(s) will consult with the
Owner, who will act as arbitrator if required.

### C. Maintainers

Projects under Rocq governance will have their own Maintainers, who have commit
access to relevant repositories and are responsible for:

- Managing the specific project.
- Writing code directly to repositories.
- Eliciting and screening the contributions of others.
- Ensuring that the Owners/Delegates are aware of community needs.

Generally, Maintainers only have authority over the specific Projects they are
responsible for though it is expected that Maintainers of different Projects
will collaborate frequently, especially in the case of major changes or
announcements. Typically, individuals who have made substantive contributions to
a Project will be invited to become Maintainers.

### D. Contributors

Contributors are wider members of the OCaml community who make valuable
contributions to projects under Rocq governance, but generally do not have
authority to make direct changes to a Project's codebase or documentation.
Anyone can become a Contributor and there is no expectation of commitment, no
specific skill requirement, and no selection process. The only necessary step is
to make or suggest some improvement or change to the Project.

Contributors can interact with a Project via tools such as email lists, issue
trackers, and wiki pages, for example. Maintainers are free to direct discussion
to their own dedicated mailing lists or preferred communication platform, as
they feel appropriate. Those whose contributions become part of a public Git
repository will be recognised in some form on a public website as thanks.

It is expected that regular Contributors to specific Projects may be asked if
they wish to become Maintainers, as described above. There is no obligation to
accept such an offer.

### E. Users

Users are the most important group and it includes the much wider community of
anyone who interacts with OCaml Projects in any way. This covers all
web-visitors, users of the Platform tools, package users and members of mailing
lists. Without Users, the Projects serve no purpose, so the impact of any major
decisions on this group should be assessed.

Wherever practicable, Users should be encouraged to provide feedback and
participate in the Projects as much as possible. Users who engage a lot with a
Project will likely go on to become Contributors.

It should be noted that these Roles are not mutually exclusive, for example
Maintainers and Contributors are necessarily also Users.

## III. rocq-prover.org

**Definition** - A Project within rocq-prover.org is characterised by its subdomain.
It is expected that the majority of new work will fall under an existing
subdomain and will therefore already have a set of Maintainers and Contributors
(as described above).

**Communication** - All Maintainers of Projects must monitor the
[`rocq-prover/rocq-prover.org`](https://github.com/rocq-prover/rocq-prover.org/) GitHub issue
tracker. The issue tracker is the primary mode of exchanging information and
decisions concerning rocq-prover.org Projects. In case Projects wish to establish
their own issue trackers, they are free to do so on GitHub (see below).

**Governance** - Projects are free to choose their mode of governance provided
it is compatible with the governance and guiding principles of Rocq governance.

### A. Disambiguation - The Meaning of rocq-prover.org

When using the term 'rocq-prover.org', there is the potential for a number of
different interpretations. To reduce confusion, these are described below, and
the meaning of the term *for this document* is also explained.

*Second-level domain name* - This is the domain name we are familiar with,
'rocq-prover.org', which has associated sub-domains and records (NB: Just for clarity
and edification, the top-level domain here is '.org').

*Community website* - This is the community-facing website, which can be found
at [rocq-prover.org](https://rocq-prover.org) and is often referred to as simply 'rocq-prover.org'.

*Infrastructure* - This may refer to virtual machines (VMs), services, or
other things that are somehow routed via the second-level domain name itself. An
obvious example is the VM that hosts the community website, but another would be
the VMs and systems that host the tarballs and files used by the Opam package
manager tool.

For the purposes of this document, we take the first meaning — that this
document relates to the governance of the second-level domain, 'rocq-prover.org'.
Therefore, anything that involves use of the domain name in some form is
affected by the governance of the domain name itself. That includes any public
facing webpages, URLs, and other resources. This is important because, in a way,
rocq-prover.org is the sum of the Projects it hosts.

To avoid confusion between the domain name itself and the community website
Project, the term 'rocq-prover.org' in this document refers *only* to the second-level
domain name itself. Any references to the domain of the community website
project will include the sub-domain 'www.rocq-prover.org', even though this is set to
redirect to [rocq-prover.org](https://rocq-prover.org).

### B. Initiating a Project 

Any proposal for new work should be raised and discussed on the
[`ocaml/infrastructure`](https://github.com/ocaml/infrastructure/) GitHub issue
tracker. If there is consensus among Maintainers that the work fits within an
existing Project, then the Maintainers of that Project can proceed with it.

If a new subdomain is required, then a brief proposal should be made on the
Infrastructure list that covers:

- The aims and purpose of the Project (inc name of the subdomain required)
- Specific resources required and for how long (e.g., VMs)
- Any impact on or relation to existing Projects
- Information about the initial Maintainers
- Details of proposed licensing arrangements for code/content

The above information is intended to stimulate discussion, so brevity is
preferred. Following discussion, and if the Owner/Delegate agrees, the resources
can be provisioned. There is no obligation for the Owner/Delegate to provide any
resources beyond the subdomain.

### C. Closing a Project

A Project can be closed:

- If it has completed its aims and the Maintainers request it be closed down
- If there are no Maintainers left to continue supporting it and no one willing
  to take on the role
- By the Owner/Delegate for any reason

In all cases, prior notice must be sent to the Infrastructure list including a
reasonable time frame and reasons for closure. Closure simply implies revocation
or redirection of the subdomain and/or shutting down or reclaiming any resources
provided (e.g., VMs).

### D. Existing Projects

Projects are referred to by their **subdomain**, and summaries of the current
Projects are maintained on the Infrastructure wiki page:
<https://github.com/ocaml/infrastructure/wiki>

## IV. Rocq Platform

The Rocq Platform is the recommended set of tools and libraris for the Rocq Prover. 
It is designed to provide a stable and consistent environment for
Rocq developers, allowing them to focus on building high-quality developments. The
tools in The Rocq Platform each have their independent lifecycle.
The [Rocq Platform](/platform) pages describe the organization of the Rocq Platform,
including package inclusion guidelines.

## V. Processes

### A. Decision Making and Communication

The preferred approach for most discussions is through
[rough consensus and running code](http://en.wikipedia.org/wiki/Rough_consensus).
Discussions should be public and take place on either the Rocq Zulip chat,
the relevant Project mailing-list, or on relevant issue trackers. Users and
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
- If the discussion still cannot be resolved, the Owner (or their Delegates) will
  act as arbitrator.

During the above, it is expected that all people will be reasonable and be
respectful of each other's efforts and viewpoints. In general, we expect to
generate consensus among the community to resolve conflicts.  

****

<!--
The version number should be changed for *any* edits that are made to this
document, even typos. Otherwise disambiguating between versions is awkward. 

Best wishes,
Amir
-->

**Version 0.1 - December 24th 2024**

- This first version of the document was adapted from the [OCaml governance](https://ocaml.org/policies/governance/)
  by Matthieu Sozeau, attempting to describe the current reality of the Rocq governance
  for discussion by the Rocq Core team. 