unit ORM.UF;

interface

uses
  System.Classes,
  SysUtils, controls, Contnrs,
  classe.dao, classe.query, rotina.retornasql,
  uConstantes, rotina.strings, orm.UFLimite, orm.UFOrigemDestino;

type
  TUF = class(TPersintentObject)
  private
    fuflimite: TUFLimiteList;
  protected
    fuforigemdestino: tuforigemdestinolist;
    Falipi: double;
    Fsguf: string;
    Fnmuf: string;
    Falicms: double;
    Fbodigito9: String;
    Fcduf: integer;
  public
    property uflimite : TUFLimiteList read fuflimite write fuflimite;
    property uforigemdestino : tuforigemdestinolist read fuforigemdestino write fuforigemdestino;
    [keyfield]
    property cduf : integer read Fcduf write fcduf;
    [AObrigatorio]
    property nmuf : string read Fnmuf write fnmuf;
    [AObrigatorio]
    property sguf : string read Fsguf write fsguf;
    [AObrigatorio]
    property alicms : double read Falicms write falicms;
    [AObrigatorio]
    property alipi : double read Falipi write falipi;
    property bodigito9 : string read Fbodigito9 write fbodigito9;
    constructor create;
    destructor destroy; override;
    class function SiglaParaCodigo(sigla:string):integer;
  end;

implementation

uses rotina.Registro;

destructor TUF.destroy;
begin
  freeandnil(fuforigemdestino);
  freeandnil(fuflimite);
  inherited;
end;

class function TUF.SiglaParaCodigo(sigla: string): integer;
begin
  result := qregistro.codigodostring(_uf, sigla, _sguf);
end;

constructor TUF.create;
begin
  inherited;
  fuforigemdestino := tuforigemdestinolist.create;
  fuflimite := tuflimitelist.create;
end;

end.
