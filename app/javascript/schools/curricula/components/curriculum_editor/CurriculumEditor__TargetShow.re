open CurriculumEditor__Types;

let str = ReasonReact.string;

let component =
  ReasonReact.statelessComponent("CurriculumEditor__TargetShow");

let archivedClasses = archived =>
  archived ?
    "target-group__target hover:bg-gray-200 target-group__target--archived border border-b-0 px-5 py-4" :
    "target-group__target hover:bg-gray-200 bg-white border border-b-0 px-5 py-6";

let make = (~target, ~targetGroup, ~showTargetEditorCB, _children) => {
  ...component,
  render: _self =>
    <div
      className={archivedClasses(target |> Target.archived)}
      onClick={
        _e => showTargetEditorCB(targetGroup |> TargetGroup.id, Some(target))
      }>
      <h5 className="font-semibold"> {target |> Target.title |> str} </h5>
    </div>,
};