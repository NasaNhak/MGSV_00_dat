#param ([string]$StartFolder)
#tex !!! path cant have anything but alphanemeric or will mess up, or rather ps is shitty about [] and probably spaces
$StartFolders = @(
".\00\init.lua",
".\00\Assets\tpp\level_asset\chara\enemy\",
".\00\Assets\tpp\level_asset\chara\player\game_object\",
".\00\Assets\tpp\level_asset\damage\ParameterTables\",
".\00\Assets\tpp\level_asset\weapon\ParameterTables\",
".\00\Assets\tpp\level_asset\weapon\ParameterTables\parts\",
".\00\Assets\tpp\motherbase\script\",
".\00\Assets\tpp\script\lib\",
".\00\Assets\tpp\script\list\",
".\00\Assets\tpp\ui\Script\",
".\00\Fox\Scripts\Gr\",
".\00\Tpp\",
".\00\Tpp\Scripts\Equip\",
".\00\Tpp\Scripts\Ui\"
)

$findFirstList = "}", ")", "]"
$findLastList = "if ", "if(", "elseif ", "elseif(", "for ", "for(", "while ", "while(", "local ", "function ", "function()", "else", "end,","dofile", "gvars.", "mvars.", "vars.", "e.", "GameObject."

$findFirstList2 = "}", ")", "]" #tex could include these if also could search for \r\n, really just need to learn some decent regex
$findLastList2 = "end", "return", "Tpp"

$findFirstList3 = "{", "}", "},", "[", "]", "],"
$findLastList3 = "{", "}", "[", "]"

$findFirstList4 = "`""
$findLastList4 = "if ", "for ", "then", "end", "else "


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