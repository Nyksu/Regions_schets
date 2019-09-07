unit main1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls;

type
  TForm1 = class(TForm)
    DB: TDatabase;
    q_sours: TQuery;
    q_bank: TQuery;
    q_set_name: TQuery;
    q_set_inn: TQuery;
    ds_sours: TDataSource;
    DBGrid1: TDBGrid;
    ds_bank: TDataSource;
    DBGrid2: TDBGrid;
    bt_start: TButton;
    procedure ds_soursDataChange(Sender: TObject; Field: TField);
    procedure bt_startClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ds_soursDataChange(Sender: TObject; Field: TField);
begin
  q_bank.Active:=false;
  q_bank.Params[0].Value:=q_sours.FieldByName('mfo').AsString;
  q_bank.Params[1].Value:=q_sours.FieldByName('acc').AsString;
  q_bank.Active:=true;
end;

procedure TForm1.bt_startClick(Sender: TObject);
begin
  q_sours.First;
  While not q_sours.EOF Do Begin
    DB.StartTransaction;
    try
    If q_bank.RecordCount>0 Then Begin
       q_set_name.Params[0].Value:=q_sours.FieldByName('name').AsString;
       q_set_name.Params[1].Value:=q_sours.FieldByName('name').AsString;
       q_set_name.Params[2].Value:=q_bank.FieldByName('id').AsInteger;
       q_set_name.ExecSQL;
       q_set_inn.Params[0].Value:=q_sours.FieldByName('inn').AsString;
       q_set_inn.Params[1].Value:=q_bank.FieldByName('id').AsInteger;
       q_set_inn.ExecSQL;
    end;
    DB.Commit;
    except
    DB.Rollback;
    end;
    q_sours.next;
  end;
end;

end.
