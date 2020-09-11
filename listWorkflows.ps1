function getWorkflows ($url) {
Connect-PnPOnline -Url $url -UseWebLogin
#$site=Get-PnPSite 
$web=Get-PnPWeb -Includes Webs
$webs=$web.webs
$listas=Get-PnPList -Includes WorkflowAssociations

$valor="URL,NomeLista,NomeFluxo,AutoStartChange,AutoStartCreate,Created,Modified,Enabled";
escreveResultados($valor)


foreach($lista in $listas){

if ($lista.WorkflowAssociations.count -gt 0){
   

   $valor=$url+","+$lista.Title+","+$lista.WorkflowAssociations.name+","+$lista.WorkflowAssociations.AutoStartChange+","+$lista.WorkflowAssociations.AutoStartCreate+","+$lista.WorkflowAssociations.Created+","+$lista.WorkflowAssociations.Modified+","+$lista.WorkflowAssociations.Enabled;

     escreveResultados($valor)
     
     }
        
        }



        foreach($webi in $webs){
        
      Connect-PnPOnline -Url $webi.Url -UseWebLogin
#$site=Get-PnPSite 
$web1=Get-PnPWeb -Includes Webs
$webs=$web1.webs
$listas1=Get-PnPList -Includes WorkflowAssociations


foreach($lista in $listas1){

if ($lista1.WorkflowAssociations.count -gt 0){
   

   $valor1=$url+","+$lista1.Title+","+$lista1.WorkflowAssociations.name+","+$lista1.WorkflowAssociations.AutoStartChange+","+$lista1.WorkflowAssociations.AutoStartCreate+","+$lista1.WorkflowAssociations.Created+","+$lista1.WorkflowAssociations.Modified+","+$lista1.WorkflowAssociations.Enabled;

     escreveResultados($valor1)
     
     }
        
        
        
        }


        Disconnect-PnPOnline

        }
        }


        
        function leSites($path){
        
        $sites=Get-Content -Path $path

        foreach ($site in $sites){

        Write-Host($site);

        #Read-Host("Aguarde")

        getWorkflows ($site)
        
        }
        
        
        }


        function escreveResultados($valor){
        
        Add-Content -Path "workflows.txt" -Value $valor
        
        }



    leSites("sites.txt")
