package it_sci.controller;

import it_sci.model.*;
import it_sci.service.CompanyService;
import it_sci.service.MentorEvaluateService;
import it_sci.service.StudentService;
import it_sci.service.TeacherEvaluateService;
import it_sci.utils.ImgPath;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicSliderUI;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private TeacherEvaluateService teacherEvaluateService;

    @Autowired
    private MentorEvaluateService mentorEvaluateService;

    @RequestMapping("/list_company")
    public String gotoTest (Model model) {
        model.addAttribute("term",teacherEvaluateService.getAllListSemester().get(0));
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("companies", companyService.getListCompanyBySemester(teacherEvaluateService.getAllListSemester().get(0)));
        model.addAttribute("company_assign", teacherEvaluateService.getCompanyAssignBySemester(teacherEvaluateService.getAllListSemester().get(0)));

        model.addAttribute("stt", "false");

        return "coordinator/list_company";
    }

    @GetMapping("/select_semester_list_company_supervision")
    public String getSelectSemesterListCompanyAssign (HttpServletRequest request,  Model model){
        String term = request.getParameter("semesterSelect");
        System.out.println("Term : " + term);
        model.addAttribute("term", term);
        model.addAttribute("list_semester", teacherEvaluateService.getAllListSemester());
        model.addAttribute("companies", companyService.getListCompanyBySemester(term.trim()));
        model.addAttribute("company_assign", teacherEvaluateService.getCompanyAssignBySemester(term.trim()));
        return "coordinator/list_company";
    }

    @GetMapping("/{termFormat}/downloadExcel_List_assign_teacher")
    public void gotoExportListAssignTeacherReportPage (HttpServletResponse response, @PathVariable("termFormat") String term, Model model) throws IOException {

        String formatTerm = term.replace("_","/");
        System.out.println("Term format : " + formatTerm);
        List<TeacherEvaluate> teacherEvaluates = teacherEvaluateService.getCompanyAssignBySemester(formatTerm);
        List<Mentor> mentors = mentorEvaluateService.getMentorEvalJoinStudent();

        System.out.println("size : " + mentors.size());
        System.out.println("teacherEvaluates: " + teacherEvaluates.size());


        // โหลดไฟล์ Excel โครงที่มีอยู่แล้ว
        FileInputStream inputStream = new FileInputStream(ImgPath.pathExcel + "/ExportAssignTeacherReport.xlsx");
        //        Workbook workbook = new XSSFWorkbook(inputStream);
        Workbook workbook = new XSSFWorkbook(inputStream);
        inputStream.close();
        // สร้าง Workbook Excel
        Sheet sheet = workbook.getSheet("Sheet1");
        int rowNum = 2;
        // สร้าง DataFormat สำหรับรูปแบบวันที่ "dd/MM/yyyy"
        DataFormat dateFormat = workbook.createDataFormat();
        CellStyle dateCellStyle = workbook.createCellStyle();
        dateCellStyle.setDataFormat(dateFormat.getFormat("dd/MM/yyyy"));

//        Row rowTitle = sheet.createRow(0);
//        rowTitle.createCell(0).setCellValue(formatTerm);

        Row rowTitle = sheet.createRow(0);

// สร้างเซลล์ในแถวและตั้งค่าค่าที่คุณต้องการ
        Cell cell = rowTitle.createCell(4);
        cell.setCellValue(formatTerm);
//        for (MentorEvaluate m : mentorEvaluateService.getMentorEvalJoinStudent()){
        int i = 1;
        for (TeacherEvaluate te : teacherEvaluates) {
            Row row = sheet.createRow(rowNum++);

            row.createCell(1).setCellValue(i++);
            row.createCell(2).setCellValue(te.getStudent().getStudent_id());
            row.createCell(3).setCellValue(te.getStudent().getStudent_name() + " " + te.getStudent().getStudent_lastname());
            row.createCell(4).setCellValue(te.getStudent().getCompany().getCompany_name());
            row.createCell(5).setCellValue(te.getStudent().getStartdate());
            row.getCell(5).setCellStyle(dateCellStyle);
            row.createCell(6).setCellValue(te.getStudent().getEnddate());
            row.getCell(6).setCellStyle(dateCellStyle);
            row.createCell(7).setCellValue(te.getTeacher().getTeacher_name() + " " + te.getTeacher().getTeacher_lastname());
            row.createCell(8).setCellValue(te.getTeacher_super_vision_date());
            row.getCell(8).setCellStyle(dateCellStyle);
            row.createCell(9).setCellValue(te.getTeacher_super_vision_time());

        }


        String fileName = "ExportAssignTeacherReport";

        // ตั้งค่า Response Header
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename="+fileName+".xlsx");

        // ส่งไฟล์ Excel กลับไปยังผู้ใช้
        workbook.write(response.getOutputStream());
        workbook.close();
    }

    @GetMapping("/{id}/view_company_detail")
    public String GetCompany(@PathVariable("id") int id, Model model){
        Company company = companyService.getCompany(id);
        model.addAttribute("company_detail",company);
        return "teacher/company_detail";
    }

}
