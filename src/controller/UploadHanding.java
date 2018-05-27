package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadBase;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadHanding
 */
@WebServlet("/UploadHanding")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class UploadHanding extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "upload";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadHanding() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + File.separator + SAVE_DIR;

		String rs = null;
		boolean uploadCompleted = false;
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory())
						.parseRequest((RequestContext) request);
				for (FileItem fileItem : multiparts) {
					if (!fileItem.isFormField()) {
						String name = new File(fileItem.getName()).getName();
						File a = new File(savePath);
						if (!a.exists())
							a.mkdirs();
						fileItem.write(new File(savePath + File.separator + name));
						rs = name;
						uploadCompleted = true;
					}
				}
			} catch (Exception e) {
				request.setAttribute("message", "File Upload Failed" + e);
			}
		} else {
			request.setAttribute("message", "Sorry!Well done!");
		}
		if (uploadCompleted) {
			response.sendRedirect("upload/" + rs);
		} else {
			getServletContext().getRequestDispatcher("/upload.jsp").forward(request, response);
		}
	}

}
