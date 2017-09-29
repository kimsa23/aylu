unit orm.RegiaoAplicacao;

interface

uses Classe.DAO;

type
  TRegiaoAplicacao = class(TRegistroQuipos)
  private
    Fcdregiaoaplicacao: integer;
    Fnmregiaoaplicacao: string;
    procedure Setcdregiaoaplicacao(const Value: integer);
    procedure Setnmregiaoaplicacao(const Value: string);
  public
    [keyfield]
    property cdregiaoaplicacao : integer read Fcdregiaoaplicacao write Setcdregiaoaplicacao;
    property nmregiaoaplicacao : string read Fnmregiaoaplicacao write Setnmregiaoaplicacao;
  end;

implementation

procedure TRegiaoAplicacao.Setcdregiaoaplicacao(const Value: integer);
begin
  Fcdregiaoaplicacao := Value;
end;

procedure TRegiaoAplicacao.Setnmregiaoaplicacao(const Value: string);
begin
  Fnmregiaoaplicacao := Value;
end;

end.
