package com.monginis.ops.constant;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VpsImageUpload {

	/*
	 * private static final String FR_FOLDER =
	 * "/opt/apache-tomcat-8.5.37/webapps/uploadspune/FR/"; private static final
	 * String SP_CAKE_FOLDER =
	 * "/opt/apache-tomcat-8.5.37/webapps/uploadspune/SPCAKE/"; private static final
	 * String CUST_CHOICE_PHOTO_CAKE_FOLDER =
	 * "/opt/apache-tomcat-8.5.37/webapps/uploadspune/CUSTCHOICEPHOTOCAKE/"; private
	 * static final String GVN_PHOTO_FOLDER =
	 * "/opt/apache-tomcat-8.5.37/webapps/uploadspune/GVN/";
	 */
	//public static final String fileUploadPath = "/opt/cpanel/ea-tomcat85/webapps/uploads/kolhapur/";
	//public static final String fileUploadPath = "/home/lenovo/AkhileshWorkspace/MOBILEUPLOADS/";
	//public static final String fileUploadPath = "/opt/cpanel/ea-tomcat85/webapps/uploads/baroda/";
	
	private static final String FR_FOLDER = Constant.fileUploadPath + "FR/";
	private static final String SP_CAKE_FOLDER = Constant.fileUploadPath + "SPCAKE/";
	private static final String CUST_CHOICE_PHOTO_CAKE_FOLDER = Constant.fileUploadPath + "CUSTCHOICEPHOTOCAKE/";
	
	private static final String GVN_PHOTO_FOLDER = Constant.fileUploadPath + "GVN/";

	public void saveUploadedFiles(List<MultipartFile> files, int imageType, String imageName) throws IOException {

		for (MultipartFile file : files) {

			if (file.isEmpty()) {

				continue;

			}

			Path path = Paths.get(FR_FOLDER + imageName);

			byte[] bytes = file.getBytes();

			if (imageType == 1) {
				System.out.println("Inside Image Type =1");

				path = Paths.get(FR_FOLDER + imageName);

				System.out.println("Path= " + path.toString());

			} else if (imageType == 4) {

				path = Paths.get(SP_CAKE_FOLDER + imageName);

			}

			else if (imageType == 5) {

				path = Paths.get(CUST_CHOICE_PHOTO_CAKE_FOLDER + imageName);

			} else if (imageType == 6) {

				path = Paths.get(GVN_PHOTO_FOLDER + imageName);

			}

			System.out.println("****************** path " + path);
			Files.write(path, bytes);

		}

	}

}
