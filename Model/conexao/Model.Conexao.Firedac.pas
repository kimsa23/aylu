unit Model.Conexao.Firedac;

interface

uses Model.Conexao.Interfaces, System.Classes, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Comp.UI;

type
  TModelConexaoFiredac = class(TInterfacedObject, IModelConexao, IModelConexaoParametros)
    private
      FConexao : TFDConnection;
      FDGUIxWaitCursor: TFDGUIxWaitCursor;
      FDPhysFBDriverLink: TFDPhysFBDriverLink;
      FDatabase : string;
      FUserName : string;
      FPassword : string;
      FDriverId : string;
      FServer : string;
      FPorta : Integer;
      procedure LerParametros;
      function Parametros : IModelConexaoParametros;
    public
      constructor create;
      destructor destroy; override;
      class function New:IModelConexao;
      function EndConexao : TComponent;
      function Database(value : string):ImodelConexaoParametros;
      function UserName(value : string):ImodelConexaoParametros;
      function Password(value : string):ImodelConexaoParametros;
      function DriverId(value : string):ImodelConexaoParametros;
      function Server(value : string):ImodelConexaoParametros;
      function Porta(value : integer):ImodelConexaoParametros;
      function EndParametros : IModelConexao;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoFiredac }

procedure TModelConexaoFiredac.LerParametros;
begin
  FConexao.Params.Database := FDatabase;
  FConexao.Params.UserName := FUserName;
  FConexao.Params.Password := FPassword;
  FConexao.Params.DriverID := FDriverId;
  FConexao.Params.Add('Server='+FServer);
  FConexao.Params.Add('Port='+fporta.ToString);
  FConexao.Params.Database := FDatabase;
  FConexao.Params.Database := FDatabase;
end;

constructor TModelConexaoFiredac.create;
begin
  FConexao           := TFDConnection.Create(nil);
  FDGUIxWaitCursor   := TFDGUIxWaitCursor.Create(nil);
  FDPhysFBDriverLink := TFDPhysFBDriverLink.Create(nil);
  LerParametros;
  FConexao.Connected := True;
end;

function TModelConexaoFiredac.Database(value: string): ImodelConexaoParametros;
begin
  result := Self;
  FDatabase := value;
end;

destructor TModelConexaoFiredac.destroy;
begin
  freeandnil(FDGUIxWaitCursor);
  freeandnil(FDPhysFBDriverLink);
  freeandnil(FConexao);
  inherited;
end;

function TModelConexaoFiredac.DriverId(value: string): ImodelConexaoParametros;
begin
  result := Self;
  FDriverId := value;
end;

function TModelConexaoFiredac.EndConexao: TComponent;
begin
  result := FConexao;
end;

function TModelConexaoFiredac.EndParametros: IModelConexao;
begin
  result := Self;
end;

class function TModelConexaoFiredac.New: IModelConexao;
begin
  result := Self.create;
end;

function TModelConexaoFiredac.Parametros: IModelConexaoParametros;
begin
//
end;

function TModelConexaoFiredac.Password(value: string): ImodelConexaoParametros;
begin
  result := Self;
  FPassword := value;
end;

function TModelConexaoFiredac.Porta(value: integer): ImodelConexaoParametros;
begin
  result := Self;
  fporta := value;
end;

function TModelConexaoFiredac.Server(value: string): ImodelConexaoParametros;
begin
  result := Self;
  FServer := value;
end;

function TModelConexaoFiredac.UserName(value: string): ImodelConexaoParametros;
begin
  result := Self;
  FUserName := value;
end;

end.
