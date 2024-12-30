open Data_intf

module Academic_institution : sig
  include module type of Academic_institution

  val all : t list
  val featured : t list
  val get_by_slug : string -> t option
end

module Academic_testimonial : sig
  include module type of Academic_testimonial

  val all : t list
end

module Book : sig
  include module type of Book

  val all : t list
  val get_by_slug : string -> t option
end

module Changelog : sig
  include module type of Changelog

  val all : t list
  val get_by_slug : string -> t option
end

module Code_example : sig
  type t = { title : string; body : string }

  val get : string -> t
end

module Event : sig
  include module type of Event

  module RecurringEvent : sig
    type t = recurring_event

    val all : t list
    val get_by_slug : string -> t option
  end

  val all : t list
  val get_by_slug : string -> t option
end

module Exercise : sig
  include module type of Exercise

  val all : t list
  val filter_tag : ?tag:string -> t list -> t list
  val get_by_slug : string -> t option
end

module Governance : sig
  include module type of Governance

  val teams : team list
  val working_groups : team list
  val get_by_id : string -> team option
end

module Industrial_user : sig
  include module type of Industrial_user

  val all : t list
  val featured : t list
  val get_by_slug : string -> t option
end

module Job : sig
  include module type of Job

  val all : t list
end

module Testimonial : sig
  include module type of Testimonial

  val all : t list
end

module News : sig
  include module type of News

  val all : t list
  val get_by_slug : string -> t option
end

module Opam_user : sig
  include module type of Opam_user

  val all : t list

  val make :
    name:string ->
    ?email:string ->
    ?github_username:string ->
    ?avatar:string ->
    unit ->
    t

  val find_by_name : string -> t option
end

module Page : sig
  include module type of Page

  val get : string -> t
end

module Paper : sig
  include module type of Paper

  val all : t list
  val featured : t list
  val get_by_slug : string -> t option
end

module Planet : sig
  include module type of Planet

  val all : entry list
end

module Release : sig
  include module type of Release

  val all : t list
  val get_by_version : string -> t option
  val latest : t
  val latest_platform : t
  val lts : t
end

module Resource : sig
  include module type of Resource

  val all : t list
  val featured : t list
end

module Success_story : sig
  include module type of Success_story

  val all : t list
  val get_by_slug : string -> t option
end

module Tool : sig
  include module type of Tool

  val all : t list
  val get_by_slug : string -> t option
end

module Consortium_page : sig
  include module type of Consortium_page

  val all : t list
  val get_by_slug : string -> t option
end

module Tool_page : sig
  include module type of Tool_page

  val all : t list
  val get_by_slug : string -> t option
end

module Tutorial : sig
  include module type of Tutorial

  val all : t list
  val all_search_documents : search_document list
  val get_by_slug : string -> t option
  val search_documents : string -> search_document list
end

module Roadmap : sig
  include module type of Roadmap

  val roadmap : t
end
module Video : sig
  include module type of Video

  val all : t list
end

module Conference : sig
  include module type of Conference

  val all : t list
  val get_by_slug : string -> t option
end
