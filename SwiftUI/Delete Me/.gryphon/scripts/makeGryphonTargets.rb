require 'xcodeproj'

if ARGV.length < 1
    STDERR.puts "Error: please specify the path to the Xcode project as an argument."
    exit(false)
end

project_path = ARGV[0]
project = Xcodeproj::Project.open(project_path)

gryphonTargetName = "Gryphon"
gryphonBuildPhaseName = "Call Gryphon"
kotlinTargetName = "Kotlin"
kotlinBuildPhaseName = "Compile Kotlin"

####################################################################################################
# Make the Gryphon target

# Create the new target (or fetch it if it exists)
gryphonTarget = project.targets.detect { |target| target.name == gryphonTargetName }
if gryphonTarget == nil
	puts "	Creating new Gryphon target..."
	gryphonTarget = project.new_aggregate_target(gryphonTargetName)
else
	puts "	Updating Gryphon target..."
end

# Set the product name of the target (otherwise Xcode may complain)
# Set the build settings so that only the "My Mac" platform is available
gryphonTarget.build_configurations.each do |config|
	config.build_settings["PRODUCT_NAME"] = "Gryphon"
	config.build_settings["SUPPORTED_PLATFORMS"] = "macosx"
	config.build_settings["SUPPORTS_MACCATALYST"] = "FALSE"
end

# Create a new run script build phase (or fetch it if it exists)
gryphonBuildPhase = gryphonTarget.shell_script_build_phases.detect { |buildPhase|
	buildPhase.name == gryphonBuildPhaseName
}
if gryphonBuildPhase == nil
	puts "	Creating new Run Script build phase..."
	gryphonBuildPhase = gryphonTarget.new_shell_script_build_phase(gryphonBuildPhaseName)
else
	puts "	Updating Run Script build phase..."
end

# Set the script we want to run
if ARGV.length > 1
	# If we specified a toolchain
    gryphonBuildPhase.shell_script =
		"gryphon \"${PROJECT_NAME}.xcodeproj\"" +
		" \"${SRCROOT}/gryphonInputFiles.xcfilelist\"" +
		" --toolchain=\"" + ARGV[1] + "\""
else
	# If we're using the default toolchain
    gryphonBuildPhase.shell_script =
		"gryphon \"${PROJECT_NAME}.xcodeproj\"" +
		" \"${SRCROOT}/gryphonInputFiles.xcfilelist\""
end

####################################################################################################
# Make the Kotlin target

# Create the new target (or fetch it if it exists)
kotlinTarget = project.targets.detect { |target| target.name == kotlinTargetName }
if kotlinTarget == nil
	puts "	Creating new Kotlin target..."
	kotlinTarget = project.new_aggregate_target(kotlinTargetName)
else
	puts "	Updating Kotlin target..."
end

# Set the product name of the target (otherwise Xcode may complain)
# Set the build settings so that only the "My Mac" platform is available
# Create a new build setting for setting the Android project's folder
kotlinTarget.build_configurations.each do |config|
	config.build_settings["PRODUCT_NAME"] = "Kotlin"
	config.build_settings["SUPPORTED_PLATFORMS"] = "macosx"
	config.build_settings["SUPPORTS_MACCATALYST"] = "FALSE"

	# Don't overwrite the Android root folder the user if the user sets it manually
	if config.build_settings["ANDROID_ROOT"] == nil
		config.build_settings["ANDROID_ROOT"] = "../Android"
	end
end

# Create a new run script build phase (or fetch it if it exists)
kotlinBuildPhase = kotlinTarget.shell_script_build_phases.detect { |buildPhase|
	buildPhase.name == kotlinBuildPhaseName
}
if kotlinBuildPhase == nil
	puts "	Creating new Run Script build phase..."
	kotlinBuildPhase = kotlinTarget.new_shell_script_build_phase(kotlinBuildPhaseName)
else
	puts "	Updating Run Script build phase..."
end

# Set the script we want to run
kotlinBuildPhase.shell_script =
	"bash .gryphon/scripts/compileKotlin.sh"

####################################################################################################
# Save the changes to disk
project.save()
