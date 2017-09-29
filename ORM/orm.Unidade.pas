unit orm.Unidade;

interface

uses System.SysUtils,
  uConstantes,
  Rotina.Retornasql, Rotina.Registro,
  Classe.DAO, classe.gerar;

type
  TUnidade = class(TRegistroQuipos)
  private
    fcdunidade : Integer;
    fnmunidade : string;
    fsgunidade : string;
    fbomdfe : String;
    fbocte : String;
  public
    [keyfield]
    property cdunidade : Integer read fcdunidade write fcdunidade;
    property nmunidade : string read fnmunidade write fnmunidade;
    property sgunidade : string read fsgunidade write fsgunidade;
    property bomdfe : String read fbomdfe write fbomdfe;
    property bocte : String read fbocte write fbocte;
    function Insert(boscript:boolean=false): String;
    class function CodigodoNome(nome:string):Integer;
    class function InserirUnidadeSeNaoExistir(nome:string):integer;
  end;

implementation

class function TUnidade.CodigodoNome(nome: string): Integer;
var
  unidade : TUnidade;
begin
  result := qregistro.CodigodoNomeInteiro(_unidade, nome);
  if result = 0 then
  begin
    unidade := TUnidade.Create;
    try
      unidade.nmunidade := nome;
      unidade.Insert;
      result := unidade.cdunidade;
    finally
      FreeAndNil(unidade);
    end;
  end;
end;

class function TUnidade.InserirUnidadeSeNaoExistir(nome: string): integer;
var
  unidade : tunidade;
begin
  unidade := tunidade.create;
  try
    if not unidade.select(_nmunidade+'='+UpperCase(nome.QuotedString)) then
    begin
      unidade.cdunidade := qgerar.GerarCodigo(_unidade);
      unidade.nmunidade := nome;
      unidade.Insert;
    end;
    result := unidade.cdunidade;
  finally
    freeandnil(unidade);
  end;
end;

function TUnidade.Insert(boscript: boolean): String;
begin
  if cdunidade = 0 then
  begin
    cdunidade := qgerar.GerarCodigo(_unidade);
  end;
  result := inherited insert(boscript);
end;

end.
