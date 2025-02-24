[CmdletBinding()]
param(
	[String] $CommitMsg
)

if ([String]::IsNullOrEmpty($CommitMsg)) {
	$version = Get-Content -Path "pubspec.yaml" | Select-String -Pattern "^version:" | ForEach-Object { ($_ -split ":\s*")[1].Trim() }
	$CommitMsg = "Deploy for $version"
}

Write-Host "PS: Cleaning existing build repository..."
flutter clean | Out-File -FilePath "deploy.log"

Write-Host "PS: Getting packages..."
flutter pub get | Out-File -FilePath "deploy.log"

Write-Host "PS: Generating localizations..."
flutter gen-l10n | Out-File -FilePath "deploy.log"

Write-Host "PS: Building Web target..."
flutter build web --release --base-href /hd2mm_web/ | Out-File -FilePath "deploy.log"

Set-Location build/web/

Write-Host "PS: Deploying to GitHub..."
git init | Out-File -FilePath "deploy.log"
git add . | Out-File -FilePath "deploy.log"
git commit -m "$CommitMsg" | Out-File -FilePath "deploy.log"
git branch -M deploy | Out-File -FilePath "deploy.log"
git remote add origin https://github.com/teutinsa/hd2mm_web | Out-File -FilePath "deploy.log"
git push -u -f origin deploy | Out-File -FilePath "deploy.log"

Set-Location ../../
Write-Host "PS: Deployment success!"