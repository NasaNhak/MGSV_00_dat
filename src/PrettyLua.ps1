$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
 
Write-Host "Current script directory is $ScriptDir"

#param ([string]$StartFolder)
#tex !!! path cant have anything but alphanemeric or will mess up, or rather ps is shitty about [] and probably spaces
$StartFolders = @(
"$ScriptDir\00\init.lua",
"$ScriptDir\00\Assets\tpp\level_asset\chara\enemy\",
"$ScriptDir\00\Assets\tpp\level_asset\chara\player\game_object\",
"$ScriptDir\00\Assets\tpp\level_asset\damage\ParameterTables\",
"$ScriptDir\00\Assets\tpp\level_asset\weapon\ParameterTables\",
"$ScriptDir\00\Assets\tpp\level_asset\weapon\ParameterTables\parts\",
"$ScriptDir\00\Assets\tpp\motherbase\script\",
"$ScriptDir\00\Assets\tpp\script\lib\",
"$ScriptDir\00\Assets\tpp\script\list\",
"$ScriptDir\00\Assets\tpp\ui\Script\",
"$ScriptDir\00\Fox\Scripts\Gr\",
"$ScriptDir\00\Tpp\",
"$ScriptDir\00\Tpp\Scripts\Equip\",
"$ScriptDir\00\Tpp\Scripts\Ui\"
)

$findFirstList = "}", ")", "]"
$findLastList = "if ", "if(", "elseif ", "elseif(", "for ", "for(", "while ", "while(", "local ", "function ", "function()", "else", "end,","dofile", "gvars.", "mvars.", "vars.", "e.", "GameObject."

$findFirstList2 = "}", ")", "]" #tex could include these if also could search for \r\n, really just need to learn some decent regex
$findLastList2 = "end", "return", "Tpp"

$findFirstList3 = "{", "}", "},", "[", "]", "],", "{{", "}}", "[[", "]]"
$findLastList3 = "{", "}", "},", "[", "]", "],"

$findFirstList4 = "`""
$findLastList4 = "if ", "for ", "then", "end", "else ", "do "


#`"
ForEach($StartFolder in $StartFolders) {
	Get-ChildItem -File -Recurse -Include *.lua -LiteralPath $StartFolder | ForEach-Object { 
		echo $_.FullName
		$luaFile = (Get-Content $_.FullName)
		ForEach($findFirst in $findFirstList) {
			#Echo $findFirst
			ForEach($findLast in $findLastList) {
				$findThing = $findFirst + $findLast
				#Echo $findThing
				$replaceThing = $findFirst + ([Environment]::NewLine) + $findLast
				#Echo $replaceThing
				#(Get-Content ($testFilePath + $testFileName)).replace($findThing, $replaceThing) |  Out-File ($testFilePath + $testFileName)
				(Get-Content ($_.FullName)).replace($findThing, $replaceThing) | Out-File -Encoding ASCII ($_.FullName)
			}
		}

		ForEach($findFirst in $findFirstList2) {
			#Echo $findFirst2
			ForEach($findLast in $findLastList2) {
				$findThing = $findFirst + $findLast
				#Echo $findThing
				$replaceThing = $findFirst + ([Environment]::NewLine) + $findLast
				#Echo $replaceThing
				(Get-Content ($_.FullName)).replace($findThing, $replaceThing) | Out-File -Encoding ASCII ($_.FullName)
			}
		}
		
		ForEach($findFirst in $findFirstList3) {
			#Echo $findFirst2
			ForEach($findLast in $findLastList3) {
				$findThing = $findFirst + $findLast
				#Echo $findThing
				$replaceThing = $findFirst + ([Environment]::NewLine) + $findLast
				#Echo $replaceThing
				(Get-Content ($_.FullName)).replace($findThing, $replaceThing) | Out-File -Encoding ASCII ($_.FullName)
			}
		}
		
		ForEach($findFirst in $findFirstList4) {
			#Echo $findFirst2
			ForEach($findLast in $findLastList4) {
				$findThing = $findFirst + $findLast
				#Echo $findThing
				$replaceThing = $findFirst + ([Environment]::NewLine) + $findLast
				#Echo $replaceThing
				(Get-Content ($_.FullName)).replace($findThing, $replaceThing) | Out-File -Encoding ASCII ($_.FullName)
			}
		}
	}
}